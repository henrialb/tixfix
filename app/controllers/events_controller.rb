class EventsController < ApplicationController
  def show
  end

  def index
    @events = policy_scope(Event)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
