# SOURCE: https://thoughtbot.com/upcase/videos/generating-pdfs-with-rails#add-download-class-to-handle-pdf-rendering

class Download < ApplicationRecord
  belongs_to :ticket

  def filename
    "#{ticket.created_at.strftime("%Y%m%d")}_#{ticket.event_category.event.name}_#{ticket.event_category.name}_#{ticket.event_category.price}_##{ticket.id}"
  end

  def render_attributes
    {
      template: 'tickets/show.html.erb',
      layout: 'pdf',
      locals: {
        ticket: ticket,
        event: ticket.event_category.event,
        event_category: ticket.event_category,
        order: ticket.order
      }
    }
  end

  private

  # def as_html
  #   # Nota bene: tuto version was returning error (below)
  #   render render_attributes
  #   # Solution: https://stackoverflow.com/questions/58328018/getting-undefined-method-view-paths-for-actionviewlookupcontext0x00007f
  #   # ActionController::Base.new.render_to_string(render_attributes)
  # end
end
