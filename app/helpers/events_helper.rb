module EventsHelper
  def percentage_sold(event)
    tickets_sold = event.tickets.count
    inventory = event.inventory.values.sum
    percentage(tickets_sold, inventory)
  end
end
