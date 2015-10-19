class ConversationsController < ApplicationController


  def show
    @conversation = find_convo
  end

  private
  def find_convo
    Conversation.find(params[:id])
  end
end
