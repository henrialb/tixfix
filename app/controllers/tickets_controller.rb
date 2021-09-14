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
    ticket = Ticket.find_by(hex: params[:hash])
    raise
    if current_organization == ticket.order.event.organization
      # Check if user has the right authorization and has validation mode ON (create this?)
      # Check if event is live
      # Validate ticket
    else
      # Validation not authorized
      # If user belongs to organization and has the authorization level to validate tixs, ask if they want to turn validation mode ON
    end
  end
end
