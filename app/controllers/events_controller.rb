class EventsController < ApplicationController
  def index
    @event = Event.new
  end

  def create
    event = Event.create(event_params)

    if event.valid?
      render json: event
    else
      render json: { errors: event.errors.full_messages }, status: 500
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :start_date, :end_date)
  end
end
