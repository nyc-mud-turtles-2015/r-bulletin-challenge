class TopicsController < ApplicationController

  def index
    @topics = Topic.all
  end

  def show
    @conversation = Conversation.new
    @topic = Topic.find(params[:id])
    @conversations = @topic.conversations
  end

end
