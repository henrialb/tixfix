class Client < ApplicationRecord
  has_many :orders
  has_many :tickets, through: :orders
  has_many :events, through: :orders

  validates_presence_of :name
  validates :email, presence: true, unless: :phone, message: "Must have either phone or email to be able to send tickets"
  validates :phone, uniqueness: { scope: :email }
end
