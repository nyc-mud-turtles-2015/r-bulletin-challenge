class ConversationsController < ApplicationController
  def show
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages.order(created_at: :asc)
  end

  def active
    @conversations = Topic.find(params[:topic_id]).conversations
  end

  def new
    @selection_options = Topic.all.pluck(:name, :id)
    @conversation = Conversation.new
  end

  def create
    @conversation = Conversation.new(conversation_params)
    @conversation.topic_id = params[:topic_id]
    @conversation.user_id = session[:user_id]

    if @conversation.save
      redirect_to conversation_path(@conversation)
    else
      render :new
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:name)
  end
end
