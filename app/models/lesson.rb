class Lesson < ApplicationRecord
  has_many :reservations
  belongs_to :course

  validates: :level, :capacity, :date, :start_time, :end_time, :fee, presence: true
end
