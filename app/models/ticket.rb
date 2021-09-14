class Ticket < ApplicationRecord
  belongs_to :event_category
  belongs_to :order
  has_one :download
  has_one_attached :pdf

  validates :hex, presence: true, uniqueness: true

  before_create :generate_hex


  def qr_code(size)
    qr = RQRCode::QRCode.new(hex)
    qr.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      standalone: true,
      module_size: size
    ).html_safe
  end

  private

  def generate_hex
    self.hex = SecureRandom.hex
  end
end
