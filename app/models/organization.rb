class Organization < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :venues, through: :events
  has_one_attached :logo

  validates :name, presence: true, uniqueness: true
end
