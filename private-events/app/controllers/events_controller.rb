class EventsController < ApplicationController
  before_action :sign_in, only: [:new, :create]

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(whitelist_params)
    if @event.save
      redirect_to @event, notice: "Event successfully created"
    else
      render 'new'
    end
  end

  def show
    @event     = Event.find(params[:id])
    @uninvited = User.all - @event.attendees
  end

  def index
    @events          = Event.all
    @upcoming_events = Event.upcoming
    @past_events     = Event.past
  end

  private

    def whitelist_params
      params.require(:event).permit(:description, :date_of)
    end

    def sign_in
      redirect_to signin_path, notice: "Sign in to create Event" unless signed_in?
    end
end
