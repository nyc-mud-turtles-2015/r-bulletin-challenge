class ConversationsController < ApplicationController
  include ApplicationHelper
  before_action :load_conversation, only: [:show, :edit]

  def index
    @conversations = Topic.find_by(id: params[:topic_id]).conversations
  end

  def new
    @conversation = Conversation.new
    @topic = Topic.find(params[:topic_id])
  end

  def create
    conversation = Conversation.new(params[:conversation].permit(:name))
    conversation.topic_id = params[:topic_id]
    current_user.conversations << conversation

  end

  def show
  end


  def latest
    @conversations = Topic.find_by(id: params[:topic_id]).conversations.order(created_at: :desc).limit(5)
    render '/conversations/index'
  end

  private

  def load_conversation
    @conversation = Conversation.find_by(id: params[:id])
    @messages = @conversation.messages.order(created_at: :desc)
  end
end
