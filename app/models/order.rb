class Order < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :event
  has_many :tickets, dependent: :destroy

  accepts_nested_attributes_for :tickets, allow_destroy: true

  after_create :create_client

  def inventory
    # returns a hash of {event_category (obj) => tickets (obj) }
    hash = {}
    tickets.group_by(&:event_category).each do |key, value|
      hash[key.id] = value.count
    end
    hash
    # Ticket.where(order_id: self.id).group(:event_category_id).count
  end

  def create_client
    Client.create!(order: self)
  end
end
