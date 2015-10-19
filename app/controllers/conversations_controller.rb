class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.all
  end

  def show
    @conversation = Conversation.find(params[:id])
  end

  def active
    @active_conversations = Conversation.active
  end

end
