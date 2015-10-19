class ConversationsController < ApplicationController
  def show
    @messages = Conversation.find(params[:id]).messages.order(created_at: :asc)
  end

  def active
    @conversations = Topic.find(params[:topic_id]).conversations
  end
end
