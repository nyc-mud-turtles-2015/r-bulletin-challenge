class MessagesController < ApplicationController

  def index
    @messages = Message.where(conversation_id: params[:conversation_id])
  end

end
