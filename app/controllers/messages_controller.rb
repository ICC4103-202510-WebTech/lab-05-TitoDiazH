class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def show
    @Message = Message.find(params["id"])
  end
end
