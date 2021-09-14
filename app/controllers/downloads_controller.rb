class DownloadsController < ApplicationController
  before_action :set_ticket, :set_event, :set_event_category, :set_order, only: [:print]

  def print
    respond_to do |format|
      format.pdf { send_ticket_pdf }

      if Rails.env.development?
        format.html { render_sample_html }
      end
    end
  end

  private

  def download
    Download.new(ticket: @ticket)
  end

  def send_ticket_pdf
    send_file download.to_pdf, download_attributes
  end

  def render_sample_html
    render download.render_attributes
  end

  def download_attributes
    {
      filename: download.filename,
      type: "application/pdf",
      disposition: "inline"
    }
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
    authorize @ticket
  end

  # variables to be used in show.html.erb

  def set_order
    @order = Order.find(@ticket.order.id)
  end

  def set_event_category
    @event_category = EventCategory.find(@ticket.event_category.id)
  end

  def set_event
    @event = Event.find(@ticket.event_category.event.id)
  end
end
