class EventCategory < ApplicationRecord
  belongs_to :event

  validates_presence_of :price, :capacity, :name
  validates :price, numericality: true
end
