class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { manager: 0, admin: 1, staff: 2 }

  belongs_to :organization, optional: true
  has_one_attached :avatar

  validates_presence_of :name, :role
end
