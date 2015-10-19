class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    if message.save
      if request.xhr?
        render plain: "<li>#{message.content}</li>"
      else
        redirect_to conversation_url(message.conversation)
      end
    else
      if request.xhr?
        render plain: "Your message offends", :status => 423
      else
      flash.now[:alert] = "Your book was not EVER FOUND"
      redirect_to :controller => 'conversations', :action => 'show', :id => message.conversation.id
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :conversation_id).merge(user: current_user)
  end

end
