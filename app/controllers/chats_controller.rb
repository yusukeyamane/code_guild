class ChatsController < ApplicationController
  before_action :set_contract, only: [:show, :change_contrarct_situation]
  def index
    @contracts = Contract.where(host_user_id: current_user.id, situation: "doing")
    if Contract.where(guest_user_id: current_user.id ,situation: "doing").present?
      Contract.where(guest_user_id: current_user.id ,situation: "doing").each do |c|
        @contracts << c
      end
    end
  end

  def show
    @chat = Chat.new
    @chats = Chat.where(contract_id: params[:id])
    if @contract.host_user_id == current_user.id
      @another_user = User.find(@contract.guest_user_id)
    else
      @another_user = User.find(@contract.host_user_id)
    end
    config_pusher = YAML.load_file('config/pusher.yml')[Rails.env]
    @pusher_access_key = config_pusher['access_key']
  end

  # def purchase
  #   webpay = WebPay.new(WEBPAY_SECRET_KEY)
  #   webpay.charge.create(currency: 'jpy', amount: Contract.find(params[:id]).contractable.charge, card: params['webpay-token'])
  #   redirect_to controller: :contracts, action: :index, flash: { success: "支払いが完了しました！" }
  # end

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      # 発行するPusherのチャンネルとイベント名を指定。それに紐づくプロパティ（キーとバリュー）を指定。
      # プロパティのバリューはViewで「data.キー名」と記述することで取り出せる
      Pusher.trigger('general_channel', 'chat_event', chat_params.merge(user_id: current_user.id, username: current_user.name, avatar: current_user.avatar))
      render :text => 'OK', :status => 200
    end
  end

  def search
    @contracts = Contract.where(host_user_id: current_user.id, situation: params[:contract_situation_form])
    if Contract.where(guest_user_id: current_user.id ,situation: params[:contract_situation_form]).present?
      Contract.where(guest_user_id: current_user.id ,situation: params[:contract_situation_form]).each do |c|
        @contracts << c
      end
    end
  end

  def change_contrarct_situation
    lecture_id = @contract.contractable_id
    @reject_users = Contract.where { contractable_id.eq lecture_id }
    @reject_users.update_all({ situation: "done" })
    @contract.update(situation: "doing")
    redirect_to chat_path(@contract)
  end

  private

  def set_contract
    @contract = Contract.find(params[:id])
  end

  def chat_params
    params.require(:chat).permit(:message, :contract_id).merge(user_id: current_user.id)
  end

  def create_params
    params..require(:chat).permit(:contract_id)
  end

end
