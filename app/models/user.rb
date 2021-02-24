class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :phone_number, :first_name, :last_name, presence: true
  #validates :phone_number

  has_one_attached :photo
  has_many :reservations, dependent: :destroy
  has_many :trailers
  has_many :trailers, through: :reservations
end
