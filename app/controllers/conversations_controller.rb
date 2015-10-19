class ConversationsController < ApplicationController
  def show
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages.order(created_at: :asc)
  end

  def active
    @conversations = Topic.find(params[:topic_id]).conversations
  end
end
