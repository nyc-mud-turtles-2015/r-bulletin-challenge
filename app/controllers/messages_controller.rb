class MessagesController < ApplicationController
  include ApplicationHelper
  before_action :load_message
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
    @conversation = Conversation.find_by(id: params[:conversation_id])
  end

  def create
    @message = Message.new(params[:message].permit(:content))
    @message.conversation_id = params[:conversation_id]
    @message.user_id = current_user.id
    if @message.save
      redirect_to conversation_path(params[:conversation_id])
    else
      render "messages#new"
    end
  end

  private

  def load_message
    @message = Message.find_by(id: params[:id])
  end
end
