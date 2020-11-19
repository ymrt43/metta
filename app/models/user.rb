class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  has_one :profile
  has_one :card
  has_many :sns_credentials
  has_many :reservations
  has_many :lessons, through: :reservations
end
