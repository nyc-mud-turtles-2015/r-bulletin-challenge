class ConversationsController < ApplicationController

  def index
    @conversations = Conversation.where(topic_id: params[:topic_id])
  end

  def recent
    @conversations = Conversation.with_recent_messages
  end

end
