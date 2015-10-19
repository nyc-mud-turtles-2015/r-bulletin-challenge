class MessagesController < ApplicationController

  def index
    @messages = Message.where(conversation_id: params[:conversation_id])
  end

  def new
    @conversation = Conversation.find_by(id: params[:conversation_id])
    @message = Messages.new()
  end

  def create
    @message = Message.new(conversation_id: params[:conversation_id], user_id: current_user.id)
    @message.assign_attributes(message_params)
    if @message.save
      redirect_to conversation_url
    else
      render "new"
    end
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end

end
