class Order < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :event
  has_many :tickets, dependent: :destroy

  accepts_nested_attributes_for :tickets, allow_destroy: true
end
