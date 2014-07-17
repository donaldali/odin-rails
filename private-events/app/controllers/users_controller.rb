class UsersController < ApplicationController
  before_action :event_creator, only: :invite

  def new
    @user = User.new
  end

  def create
    @user = User.new(whitelist_params)
    if @user.save
      signin(@user)
      redirect_to @user, notice: "New user successfully created"
    else
      render 'new'
    end
  end

  def show
    @user   = User.find(params[:id])
    @events = @user.created_events
    @upcoming_events = @user.attended_events.upcoming
    @past_events     = @user.attended_events.past
  end

  def invite
    user_to_invite      = User.find(params[:info][:user_id])
    event_to_invite_to = Event.find(params[:info][:event_id])
    user_to_invite.attended_events << event_to_invite_to
    redirect_to event_to_invite_to
  end

  private

    def whitelist_params
      params.require(:user).permit(:name)
    end

    def event_creator
      unless current_user?(Event.find(params[:info][:event_id]).creator)
        redirect_to root_path, notice: "You can only invite people to your event"
      end
    end
end
