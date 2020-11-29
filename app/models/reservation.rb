class Reservation < ApplicationRecord
  belongs_to :lesson
  belongs_to :user

  validates :count, presence: true
end
