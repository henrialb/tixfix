class Event < ApplicationRecord
  has_many :event_categories
  has_many :tickets, through: :event_categories
  has_many :orders
  has_many :clients, through: :orders

  belongs_to :venues
  belongs_to :organization

  enum status: { uncomplete: 0, offsale: 1, onsale: 2, past: 3, cancelled: 4 }

  validates_presence_of :name, starts_at:, ends_at:
end
