class Ticket < ApplicationRecord
  belongs_to :event_category
  belongs_to :order

  validates :qr_code, uniqueness: true
end
