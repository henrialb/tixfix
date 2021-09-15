class EventCategory < ApplicationRecord
  belongs_to :event
  has_many :tickets, dependent: :destroy

  validates_presence_of :price, :capacity, :name
  validates :price, numericality: true

  def percentage_sold
    (tickets.count.to_f / capacity * 100).round
  end
end
