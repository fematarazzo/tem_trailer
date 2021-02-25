class Trailer < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_address,
    against: [ :address ],
    using: {
      tsearch: { prefix: true } 
    }
  validates :price, :model, :onboard_capacity, :description, :address, presence: true

  has_one_attached :photo
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
