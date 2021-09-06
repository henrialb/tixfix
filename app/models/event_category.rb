class EventCategory < ApplicationRecord
  belongs_to :event
  has_many :tickets

  validates_presence_of :price, :capacity, :name
  validates :price, numericality: true
end
