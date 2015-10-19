module SessionsHelper

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find_by(session[:user_id])
  end

  def current_user_name
    session[:user_name]
  end

  def login(user)
    session[:user_id] = user.id
    session[:user_name] = user.username
  end

  def logout
    session.delete(:user_id)
    session.delete(:user_name)
  end

end
