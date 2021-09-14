class TicketsController < ApplicationController
  # before_action :set_ticket, :set_event, :set_order, only: [:print]

  def show
  end

  def index
  end

  def new
  end

  def create
  end

  # def print
  #   file = Download.new(ticket: @ticket)
  #   file.to_pdf

  #   redirect_to event_order_path(@event.id, @order.id)
  # end

  # private

  # def set_ticket
  #   @ticket = Ticket.find(params[:id])
  #   authorize @ticket
  # end

  # def set_event
  #   @event = Event.find(@ticket.event_category.event.id)
  # end

  # def set_order
  #   @order = Order.find(@ticket.order.id)
  # end
end
