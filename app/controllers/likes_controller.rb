class LikesController < ApplicationController
  def new
    Like.create(user_id: session[:user_id], message_id: params[:message_id]) if Like.find_by(user_id: session[:user_id], message_id: params[:message_id]) == nil
    @message = Message.find(params[:message_id])
    if request.xhr?
      render '/likes/count', layout: false
    else
      render nothing: true
    end
  end
end
