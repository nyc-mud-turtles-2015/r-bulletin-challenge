class MessagesController < ApplicationController

  def new
    @message = Message.new
    @message.user_id = session[:user_id]
    @message.conversation_id = params[:id]
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to :topics
    else
      @errors = ["Hey stupid, you can't write a message like that"]
      redirect_to :back
    end
  end
  private

  def message_params
    params.require(:message).permit(:content, :conversation_id, :user_id)
  end
end
