class ConversationsController < ApplicationController

  def show
    @conversation = find_convo
  end

  def create

    @conversation = Conversation.new(conversation_params)
    @conversation.messages.first.user = current_user
    if @conversation.save
      if request.xhr?
        render partial: "topics/conversation", locals: {conversation: @conversation}
      else
        redirect_to @conversation
      end
    else
      if request.xhr?
        render plain: "Insufficient gerbils", :status => 422
      else
        @errors = @conversation.errors.full_messages
        @topic = Topic.find(params[:conversation][:topic_id])
        @conversations = @topic.conversations
        render 'topics/show'
        # render plain: params.to_s
      end
    end
  end

  private

  def conversation_params
     params.require(:conversation).permit(:name, :topic_id, messages_attributes: [:content]).merge(author: current_user)
  end

  def find_convo
    Conversation.find(params[:id])
  end

end
