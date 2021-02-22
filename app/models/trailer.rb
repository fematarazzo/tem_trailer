class Trailer < ApplicationRecord
  validates :price, :type, :onboard_capacity, :description, :coordinates, presence: true

  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations
  has_many :reviews, through: :reservations
end
