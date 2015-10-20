class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @conversations = @topic.conversations
    redirect_to topic_conversations_path(@topic)
  end
end
