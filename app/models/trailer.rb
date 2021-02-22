class Trailer < ApplicationRecord
  validates :price, :type, :onboard_capacity, :description, :coordinates, presence: true

  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations
end
