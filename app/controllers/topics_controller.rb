class TopicsController < ApplicationController
  before_action :load_topic

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @conversations = @topic.conversations
    render '/conversations/index'
  end

  private

  def load_topic
    # category = Category.find_by(id: params[:category_id])
    # @topic = category.topics.find_by(id: params[:id])
    @topic = Topic.find_by(id: params[:id])
  end
end
