class Ticket < ApplicationRecord
  belongs_to :event_category
  belongs_to :order

  validates :qr_code, presence: true, uniqueness: true

  before_validation :generate_qr_code

  private

  def generate_qr_code
    RQRCode::QRCode.new(self.qr_code)
  end
end
