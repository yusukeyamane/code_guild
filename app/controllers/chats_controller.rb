class ChatsController < ApplicationController
  def index
    @chat = Chat.new
    @chats = Chat.where(contract_id: params[:contract_id])
    @contract = Contract.find(params[:contract_id])
    config_pusher = YAML.load_file('config/pusher.yml')[Rails.env]
    @pusher_access_key = config_pusher['access_key']
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      # 発行するPusherのチャンネルとイベント名を指定。それに紐づくプロパティ（キーとバリュー）を指定。
      # プロパティのバリューはViewで「data.キー名」と記述することで取り出せる
      Pusher.trigger('general_channel', 'chat_event', chat_params)
      render :text => 'OK', :status => 200
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:message).merge(user_id: current_user.id, contract_id: params[:contract_id])
  end
end
