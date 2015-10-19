class ConversationsController < ApplicationController
  def show
    @messages = Conversation.find(params[:id]).messages.order(created_at: :asc)
  end
end
