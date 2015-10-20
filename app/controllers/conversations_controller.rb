class ConversationsController < ApplicationController

  def show
    @message = Message.new
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages.order(:created_at)
  end

  def recent
    @recent_conversations = Conversation.recently_active(25)
  end

  def create
    @conversation = Conversation.new(conversation_params)
    @conversation.author = current_user
    @conversation.topic = Topic.find(params[:topic_id])
    if @conversation.save
      redirect_to conversation_path(@conversation)
    else
      redirect_to topic_path(@conversation.topic, anchor: 'new_conversation', flash: {error: @conversation.errors.full_messages.join(', ')})
    end
  end

  private
    def conversation_params
      params.require(:conversation).permit(:name)
    end

end
