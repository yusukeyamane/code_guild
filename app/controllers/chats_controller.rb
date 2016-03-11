class ChatsController < ApplicationController
  def index
    @chats = Chat.where(contract_id: params[:contract_id])
    @contract = Contract.find(params[:contract_id])
    config_pusher = YAML.load_file('config/pusher.yml')[Rails.env]
    @pusher_access_key = config_pusher['access_key']
  end

  def create
    Chat.create(message: params[:message], user_id: current_user.id, contract_id: params[:contract_id])
    # 発行するPusherのチャンネルとイベント名を指定。それに紐づくプロパティ（キーとバリュー）を指定。
    # プロパティのバリューはViewで「data.キー名」と記述することで取り出せる
    Pusher.trigger('general_channel', 'chat_event', {
      message: params[:message],
      username: current_user.name,
      contract_id: params[:contract_id]
    })
    render :text => 'OK', :status => 200
  end
end
