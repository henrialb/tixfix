class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update]

  def index
    @events = policy_scope(Event).sort_by(&:starts_at).reverse
  end

  def show
    @marker = [{ lat: @event.venue.latitude, lng: @event.venue.longitude }]
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
      redirect_to edit_event_path(@event.id), notice: 'Event successfully created.'
    else
      flash.now[:alert] = "Error: #{@event.errors.full_messages.join("\n")}"
      render :new
    end
  end

  def edit
    authorize @event
    if @event.event_categories.empty?
      @event.event_categories.build
    end
  end

  def update
    authorize @event
    if @event.update(event_params)
      redirect_to events_path, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :name,
      :starts_at,
      :ends_at,
      :venue_id,
      :image,
      event_categories_attributes: %i[
        id
        name
        price
        capacity
        _destroy
      ]
    )
  end

  def set_event
    @event = Event.find(params[:id])
    authorize @event
  end
end
