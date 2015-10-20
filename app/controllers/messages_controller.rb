class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.conversation = Conversation.find(params[:conversation_id])
    if @message.save
      redirect_to conversation_path(@message.conversation, anchor: @message.id)
    else
      redirect_to conversation_path(@message.conversation, anchor: 'new_message', flash: {error: @message.errors.full_messages.join(', ')})
    end
  end

  def recent
    @recent_messages = Message.order(created_at: :desc).limit(25)
  end

  private
    def message_params
      params.require(:message).permit(:content)
    end

end
