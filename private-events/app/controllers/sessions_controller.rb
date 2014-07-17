class SessionsController < ApplicationController
  before_action :already_signed_in, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user
      signin(user)
      redirect_to user, notice: "Successfully signed in"
    else
      flash.now[:error] = "User '#{params[:name]}' not found."
      render 'new'
    end
  end

  def destroy
    signout
    redirect_to signin_path, notice: "Successfully signed out"
  end

  private

    def already_signed_in
      redirect_to current_user, notice: "You are already Signed in" if signed_in?
    end
end
