class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def show
    @Message = Message.find(params["id"])
  end

  def new
    @message = Message.new
  end

  def create
  @message = Message.new(message_params)
  if @message.save
      redirect_to @message, notice: 'User created successfully.'
  else
      render :new
  end
  end

  private
  def message_params

  params.require(:message).permit(:chat_id, :user_id, :body)
  end
end
