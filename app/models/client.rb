class Client < ApplicationRecord
  has_one :order, dependent: :destroy
  has_many :tickets, through: :orders
  has_many :events, through: :orders

  # New client logic ==>
  # 1 client per order, allows for doublons
  # will be able to consolidate data later


  # Old client logic ==>
  # validates_presence_of :name
  # validates :email, presence: { message: "must have either phone or email to be able to send tickets" }, unless: :phone
  # validates :phone, uniqueness: { scope: :email }
end
