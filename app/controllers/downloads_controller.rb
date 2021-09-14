class DownloadsController < ApplicationController
  before_action :set_ticket

  def show
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

  def as_html
    render download.render_attributes
  end

  def to_pdf
    kit = PDFKit.new(as_html, page_size: 'Letter')
    kit.stylesheets << 'app/assets/stylesheets/components/_pdf.scss'
    kit.to_file("tmp/ticket.pdf")
  end

  def send_ticket_pdf
    send_file to_pdf, download_attributes
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
    @ticket = Ticket.find(params[:ticket_id])
    authorize @ticket
  end
end
