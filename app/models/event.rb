class Event < ApplicationRecord
  has_many :event_categories, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :tickets, through: :orders
  has_many :clients, through: :orders

  accepts_nested_attributes_for :event_categories, allow_destroy: true

  belongs_to :venue
  belongs_to :organization

  enum status: { incomplete: 0, offsale: 1, onsale: 2, past: 3, cancelled: 4 }

  validates_presence_of :name, :starts_at, :ends_at

  def inventory
    inventory = {}
    event_categories.each do |category|
      name = category.name
      capacity = category.capacity
      inventory[name] = capacity
    end
    inventory
  end

  def tickets_sold
    tickets_sold = {}
    event_categories.each do |category|
      name = category.name
      quantity_sold = Ticket.where(event_category: category).count
      tickets_sold[name] = quantity_sold
    end
    tickets_sold
  end
end
