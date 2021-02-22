class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :trailer
  has_many :reviews, dependent: :destroy
end
