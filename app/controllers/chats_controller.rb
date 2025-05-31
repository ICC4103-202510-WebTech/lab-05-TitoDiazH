class ChatsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  def index
    @chats = Chat.all
  end
    
  def show
    @chat = Chat.find(params["id"])
  end

  def new
    @chat = Chat.new
    @users = User.where.not(id: current_user.id) 
  end

  def create
    @chat = Chat.new(chat_params)
    @users = User.where.not(id: current_user.id)
    if @chat.save
      redirect_to @chat, notice: "Chat created successfully"
    else
      render :new
    end
  end

  def edit
    @chat = Chat.find(params[:id])
    @users = User.where.not(id: current_user.id)
  end
  
  def update
    @chat = Chat.find(params[:id])
    @users = User.where.not(id: current_user.id)
    if @chat.update(chat_params)
      redirect_to @chat, notice: 'Chat was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:sender_id, :receiver_id)
  end
end
