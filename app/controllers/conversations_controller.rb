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
    conversation = Conversation.new(params[:conversation].permit(:name))
    conversation.update(topic_id: params[:topic_id])
    current_user.conversations << conversation
    redirect_to topic_conversations_path
  end

  def show
  end

  def latest
    @conversations = Topic.find_by(id: params[:topic_id]).conversations.order(created_at: :desc).limit(3)
    redirect_to topic_conversations_path(params[:topic_id])
  end

  private

  def load_conversation
    @conversation = Conversation.find_by(id: params[:id])
    @messages = @conversation.messages.order(created_at: :desc)
  end
end
