

class MessagesController < ApplicationController

  include SessionsHelper

  def index
    @messages = Message.order(:created_at).reverse
  end

  def new
    if logged_in?
      @conversation = Conversation.find(params[:conversation])
      @message = Message.new
    else
      redirect_to login_path
    end
  end

  def create
    @message = Message.new(message_params)
    @conversation = Conversation.find(params[:message][:conversation_id])
    @user = User.find(params[:message][:user_id])
    if @message.save
       redirect_to @conversation
    else
      render 'new'
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :conversation_id, :user_id)
  end


end
