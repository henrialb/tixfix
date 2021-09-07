class Client < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :tickets, through: :orders
  has_many :events, through: :orders

  validates_presence_of :name
  validates :email, presence: { message: "must have either phone or email to be able to send tickets" }, unless: :phone
  validates :phone, uniqueness: { scope: :email }
end
