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

  def revenue(category)
    number_to_currency(category.price * category.tickets.count, unit: '€', strip_insignificant_zeros: true)
  end

  def revenue_i(category)
    category.price * category.tickets.count
  end

  def total_revenue(event)
    revenue = 0
    event.event_categories.each do |category|
      revenue += revenue_i(category)
    end
    revenue
  end
end
