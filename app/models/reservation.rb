class Reservation < ApplicationRecord
  belongs_to :lessson
  belongs_to :user

  validates :count, presence: true
end
