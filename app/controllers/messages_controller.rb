class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.conversation = Conversation.find(params[:conversation_id])
    p params
    if @message.save
      redirect_to conversation_path(@message.conversation, anchor: @message.id)
    else
      render 'new'
    end
  end

  private
    def message_params
      params.require(:message).permit(:content)
    end

end
