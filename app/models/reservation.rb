class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :trailer
  attr_accessor :start_date, :end_date

  validates :start_date, :end_date, presence: true
end
