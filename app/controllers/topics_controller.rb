class TopicsController < ApplicationController

  def index
    @topics = Topic.all
  end

  def show
    @conversations = Topic.find(params[:id]).conversations
  end

end
