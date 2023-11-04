class MessagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @messages = Message.includes(:user).order(created_at: :asc)
    @message = Message.new
  end

  def new
    @message = Message.new
  end

  def create
    @message = current_user.messages.create!(message_params)
    
    if @message.save
      redirect_to messages_path
    else
      render :new
    end
  end


  private

  def message_params
    params.require(:message).permit(:content)
  end
end
