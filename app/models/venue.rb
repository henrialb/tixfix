class Venue < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :events

  has_one_attached :map

  validates_presence_of :name, :address
  validates :address, uniqueness: { scope: :name}
end
