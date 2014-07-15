module SessionsHelper

  def sign_in user
    token = User.get_token
    cookies.permanent[:remember_token] = token
    user.update_attribute(:remember_token, User.encrypt_token(token))
    self.current_user = user
  end

  def current_user
    @current_user ||= User.find_by(remember_token: User.encrypt_token(cookies[:remember_token]))
  end

  def current_user=(user)
    @current_user = user
  end

  def sign_out
    current_user.update_attribute(:remember_token, User.encrypt_token(User.get_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  def signed_in?
    !current_user.nil?
  end
end
