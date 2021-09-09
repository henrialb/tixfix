class EventsController < ApplicationController
  def show
  end

  def index
    @events = policy_scope(Event)
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.organization = current_user.organization
    authorize @event

    if @event.save
      redirect_to events_path, notice: 'Event successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def event_params
    params.require(:event).permit(:name, :starts_at, :ends_at, :venue_id)
  end
end
