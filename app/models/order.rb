class Order < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :event
  has_many :tickets, dependent: :destroy
end
