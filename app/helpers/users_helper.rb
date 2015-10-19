module UsersHelper

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?#do we want the number of the id or the bool?
    !!(session[:user_id])
  end

end
