class Ticket < ApplicationRecord
  belongs_to :event_category
  belongs_to :order

  validates :qr_code, presence: true, uniqueness: true

  before_validation :generate_qr_code

  private

  def generate_qr_code
    self.qr_code = SecureRandom.hex
  end
end
