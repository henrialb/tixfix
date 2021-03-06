class TicketsController < ApplicationController
before_action :set_variables, only: [:show]

  def show
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      format.html { render_html }
    end
  end

  def new
  end

  def create
  end

  def validation
    @ticket = Ticket.find_by(hex: params[:hash])
    authorize @ticket

    if current_organization == @ticket.order.event.organization
      # Check if user has the right authorization and has validation mode ON (create this?)
      validation_mode = current_user.is_validation

      # Check if event is live
      # live_starts_at = @ticket.order.event.starts_at - 60 * 60 * 2 # validation starts 2 hours before event start
      # live_ends_at = @ticket.order.event.ends_at + 60 * 60 # ends 1 hour after event end
      # live = true if Time.now > live_starts_at && Time.now < live_ends_at
      # live = true if Time.now < live_starts_at && Time.now < live_ends_at # FOR TESTING

      # Validate @ticket
      # if validation_mode && live
      if validation_mode
        if @ticket.is_used
          @success = false
        else
          @ticket.update(is_used: true)
          @success = true
        end
        # redirect_to edit_user_registration_path, notice: "You are not authorized to validate!"
      elsif !validation_mode
        redirect_to event_order_path(@ticket.order.event, @ticket.order), alert: "Validation mode is off!"
      else
        redirect_to event_order_path(@ticket.order.event, @ticket.order), alert: "This event is not live yet!"
      end
    end
  end

  private

  def set_variables
    @ticket = Ticket.find(params[:id])
    authorize @ticket

    @event_category = @ticket.event_category
    @order = @ticket.order
    @event = @event_category.event
  end

  def render_html
    render 'tickets/show', layout: 'pdf', locals: {
      ticket: @ticket,
      event_category: @event_category,
      order: @order,
      event: @event
    }
  end
end
