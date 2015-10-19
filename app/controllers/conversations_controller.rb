class ConversationsController < ApplicationController

  def show
    @messages = Conversation.find(params[:id]).messages.order(created_at: :desc)
  end

  def recent
    @recent_messages = Message.order(created_at: :desc).limit(25)
  end

end
