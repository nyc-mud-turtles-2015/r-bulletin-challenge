class ConversationsController < ApplicationController

  include SessionsHelper

  def index
    @conversations = Conversation.all
  end

  def show
    @conversation = Conversation.find(params[:id])
  end

  def new
    if logged_in?
      @topic = Topic.find(params[:topic])
      @conversation = Conversation.new
    else
      redirect_to login_path
    end
  end


  def create
    p params
    @conversation = Conversation.new(conversation_params)
    @topic = Topic.find(params[:conversation][:topic_id])
    @user = User.find(params[:conversation][:user_id])
    if @conversation.save
       redirect_to @topic
    else
      render 'new'
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:name, :topic_id, :user_id)
  end

end


