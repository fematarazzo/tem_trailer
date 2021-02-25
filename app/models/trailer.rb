class Trailer < ApplicationRecord
  validates :price, :model, :onboard_capacity, :description, :address, presence: true

  has_one_attached :photo
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
