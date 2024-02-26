class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.create_event(event_params)
  end

  private

  def event_params
    params.require(:event).permit(:title, :date, :time)
  end
end
