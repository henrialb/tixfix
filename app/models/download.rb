# SOURCE: https://thoughtbot.com/upcase/videos/generating-pdfs-with-rails#add-download-class-to-handle-pdf-rendering
require 'render_anywhere'

class Download < ApplicationRecord
  include RenderAnywhere
  belongs_to :ticket

  def to_pdf
    kit = PDFKit.new(as_html)
    kit.to_file("tmp/ticket.pdf")
  end

  def filename
    "#{ticket.created_at.strftime("%Y%m%d")}_#{ticket.event_category.event.name}_#{ticket.event_category.name}_#{ticket.event_category.price}_##{ticket.id}"
  end

  def render_attributes
    # ActionController::Base.new.render_to_string(
    {
      template: "tickets/show",
      layout: "pdf",
      locals: {ticket: ticket}
    }
    # )
  end

  private

  def as_html
    render render_attributes
  end
end
