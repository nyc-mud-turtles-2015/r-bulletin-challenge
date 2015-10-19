class ConversationsController < ApplicationController

  def index
    @conversations = Conversation.where(topic_id: params[:topic_id])
  end

end
