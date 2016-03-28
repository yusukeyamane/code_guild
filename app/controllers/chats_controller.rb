class ChatsController < ApplicationController

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
    @contract = Contract.find(params[:id])
    if @contract.host_user_id == current_user.id
      @another_user = User.find(@contract.guest_user_id)
    else
      @another_user = User.find(@contract.host_user_id)
    end
    config_pusher = YAML.load_file('config/pusher.yml')[Rails.env]
    @pusher_access_key = config_pusher['access_key']
  end

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

  private
  def chat_params
    params.require(:chat).permit(:message, :contract_id).merge(user_id: current_user.id)
  end
  def create_params
    params..require(:chat).permit(:contract_id)
  end
end
