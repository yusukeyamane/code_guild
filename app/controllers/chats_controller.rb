class ChatsController < ApplicationController
  def index
    @chats = Chat.all
    config_pusher = YAML.load_file('config/pusher.yml')[Rails.env]
    @pusher_access_key = config_pusher['access_key']
  end

  def create
    Chat.create(message: params[:message], user_id: current_user.id)
    Pusher['general_channel'].trigger('chat_event', {
      message: params[:message]
    })
    render :text => 'OK', :status => 200
  end
end
