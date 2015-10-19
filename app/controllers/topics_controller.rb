class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = find_topic
    @conversations = @topic.conversations.sort_by{|convo| convo.messages.last.created_at }.reverse
    @conversation = Conversation.new
    @conversation.messages.build
  end


  private

  def find_topic
    Topic.find(params[:id])
  end

end
