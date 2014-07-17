module SessionsHelper
  def signin(user)
    session[:current_user_id] = user.id
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user
    session[:current_user_id] && User.find(session[:current_user_id])
  end

  def current_user?(user)
    current_user == user
  end

  def signout
    session[:current_user_id] = nil
  end
end
