class ConversationsController < ApplicationController
  include ApplicationHelper
  before_action :load_conversation, only: [:show, :edit]

  def index
    @topic = Topic.find_by(id: params[:topic_id])
    @conversations = @topic.conversations
  end

  def new
    @conversation = Conversation.new
    @topic = Topic.find(params[:topic_id])
  end

  def create
    conversation = Conversation.new(conv_params)
    conversation.update(topic_id: params[:topic_id])
    current_user.conversations << conversation
    redirect_to topic_conversations_path
  end

  def latest
    @conversations = Topic.find_by(id: params[:topic_id]).conversations.order(id: :desc).limit(3)
    render '/conversations/_latest'
  end

  private

  def load_conversation
    @conversation = Conversation.find_by(id: params[:id])
    @messages = @conversation.messages.order(created_at: :desc)
  end

  def conv_params
    params.require(:conversation).permit(:name)
  end
end
