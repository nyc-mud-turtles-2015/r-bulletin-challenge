class ConversationsController < ApplicationController

  def show
    @message = Message.new
    @messages = Conversation.find(params[:id]).messages.order(:created_at)
  end

  def recent
    @recent_messages = Message.order(created_at: :desc).limit(25)
  end

end
