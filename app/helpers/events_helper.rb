module EventsHelper
  def percentage_sold(event)
    tickets_sold = event.tickets.count
    inventory = event.event_categories.sum(:capacity)

    percentage(tickets_sold, inventory)
  end

  def relative_time(event)
    time = time_ago_in_words(@event.starts_at)

    event.starts_at > Time.now ? "in #{time}" : "#{time} ago"
  end
end
