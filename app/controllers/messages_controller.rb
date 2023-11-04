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
    @message = current_user.messages.build(message_params)
  
    respond_to do |format|
      if @message.save
        format.turbo_stream
        format.html { redirect_to messages_path, notice: "Message sent." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@message, partial: "messages/form", locals: { message: @message }) }
      end
    end
  end
  
  


  private

  def message_params
    params.require(:message).permit(:content)
  end
end
