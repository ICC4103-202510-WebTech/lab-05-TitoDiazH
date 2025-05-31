class MessagesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
    @chats = Chat.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    @users = User.all
  end

  def create
    @message = Message.new(message_params)
    @chats = Chat.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    @users = User.all
    if @message.save
      redirect_to messages_path, notice: 'Message created successfully.'
    else
      render :new
    end
  end

  def edit
    @message = Message.find(params[:id])
    @chats = Chat.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    @users = User.all
  end

  def update
    @message = Message.find(params[:id])
    @chats = Chat.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    @users = User.all
    if @message.update(message_params)
      redirect_to @message, notice: 'Message was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:chat_id, :user_id, :body)
  end
end
