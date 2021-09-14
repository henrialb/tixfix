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

    if current_organization == ticket.order.event.organization
      # Check if user has the right authorization and has validation mode ON (create this?)
      validation_mode = current_user.is_validation
      # Check if event is live
      live_starts_at = ticket.order.event.starts_at - 60 * 60 * 2 # validation starts 2 hours before event start
      live_ends_at = ticket.order.event.ends_at + 60 * 60 # ends 1 hour after event end
      Time.now > live_starts_at && Time.now < live_ends_at ? live = true : live = false
      raise # Testing only - remove!

      # Validate ticket
      #ticket.is_used = true
      #ticket.save! # necessary?

    # Validation not authorized
    elsif current_user.is_validation == false && current_organization = ticket.order.event.organization
      print "Would you like to turn Validation mode on?"
      input = gets.strip



      # If user belongs to organization and has the authorization level to validate tixs,
      # Ask if they want to turn validation mode ON


    end
  end
end
