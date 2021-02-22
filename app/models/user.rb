class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :description, :phone_number, :type, presence: true
  validates :phone_number, uniqueness: true

  has_many :reservations, dependent: :destroy
  has_many :trailers, through: :reservations
  has_many :reviews, through: :reservations

end
