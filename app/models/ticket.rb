class Ticket < ApplicationRecord
  belongs_to :event_category
  belongs_to :order

  validates :hex, presence: true, uniqueness: true

  before_validation :generate_hex

  private

  def generate_hex
    self.qr_code = SecureRandom.hex
  end
end
