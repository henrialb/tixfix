class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    authorize @event
  end

  def index
  #  @events = Event.all
  #  @events = Event.includes(:user).all
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
    fetch_event
  end

  def update
    if @event.update(event_params)
      authorize @event
      redirect_to @event, notice: 'Event was sucessfully updated'
    else
      render :edit
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :starts_at, :ends_at, :venue_id)
  end

  def fetch_event
    @event = Event.find(params[:id])
    authorize @event
  end
end
