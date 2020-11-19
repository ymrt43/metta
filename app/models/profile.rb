class Profile < ApplicationRecord
  belongs_to :user, optional: true
  validates :phone_num, :zipcode, :date_of_birth, presence: true
end
