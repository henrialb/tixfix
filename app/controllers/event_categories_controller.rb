class EventCategoriesController < ApplicationController
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @event_category = EventCategory.find(params[:format].to_i)
    @event = @event_category.event

    authorize @event_category

    @event_category.destroy
    redirect_to edit_event_path(@event.id)
  end
end
