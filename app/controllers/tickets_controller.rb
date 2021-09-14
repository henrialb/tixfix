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
    raise # Testing only - remove!

    if current_organization == ticket.order.event.organization
      # Check if user has the right authorization and has validation mode ON (create this?)
      validation_mode = current_user.is_validation

      # Check if event is live
      live_starts_at = ticket.order.event.starts_at - 60 * 60 * 2 # validation starts 2 hours before event start
      live_ends_at = ticket.order.event.ends_at + 60 * 60 # ends 1 hour after event end
      live = true if Time.now > live_starts_at && Time.now < live_ends_at

      # Validate ticket
      if validation_mode && live
        ticket.update(is_used: true)
      end

    # Validation not authorized
    # If user belongs to organization and has the authorization level to validate tixs,
    elsif current_user.is_validation == false && current_organization = ticket.order.event.organization
      # Ask if they want to turn validation mode ON
      print "Would you like to turn Validation mode on?"
      input = gets.strip
      if input == "yes"
        current_user.is_validation = true
        print "Validation mode enabled"
      else
        print "Validation mode disabled"
      end
    end
  end
end
