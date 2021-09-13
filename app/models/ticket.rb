class Ticket < ApplicationRecord
  belongs_to :event_category
  belongs_to :order

  validates :hex, presence: true, uniqueness: true

  before_validation :generate_hex

  def qr_code
    qr = RQRCode::QRCode.new(self.hex)
    svg = qr.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      standalone: true,
      module_size: 3
    ).html_safe
  end

  private

  def generate_hex
    self.hex = SecureRandom.hex
  end
end
