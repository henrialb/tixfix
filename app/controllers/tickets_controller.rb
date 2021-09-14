class TicketsController < ApplicationController
  def show
  end

  def index
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
      live_starts_at = @ticket.order.event.starts_at - 60 * 60 * 2 # validation starts 2 hours before event start
      live_ends_at = @ticket.order.event.ends_at + 60 * 60 # ends 1 hour after event end
      live = true if Time.now > live_starts_at && Time.now < live_ends_at

      # Validate @ticket
      @ticket.is_used = true if validation_mode && live

      unless @ticket.save
        redirect_to user_registration_path, notice: "You are not authorized to validate!"
      end
    end
  end
end
