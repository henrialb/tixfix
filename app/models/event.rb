class Event < ApplicationRecord
  has_many :event_categories, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :tickets, through: :orders
  has_many :clients, through: :orders
  has_one_attached :image
  has_one_attached :venue_map

  accepts_nested_attributes_for :event_categories, allow_destroy: true

  belongs_to :venue
  belongs_to :organization

  enum status: { incomplete: 0, offsale: 1, onsale: 2, past: 3, cancelled: 4 }

  validates_presence_of :name, :starts_at, :ends_at

  def past?
    ends_at < Date.today
  end
end
