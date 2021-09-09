class Organization < ApplicationRecord
  has_one_attached :logo
  has_many :users, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :venues, through: :events
  has_many :clients, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :website, uniqueness: true, allow_nil: true
end
