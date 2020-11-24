class Lesson < ApplicationRecord
  has_many :reservations
  belongs_to :course

  validates :level, :capacity, :date, :start_time, :end_time, :fee, presence: true

  enum level: { "初心者向け": 1, "中級者向け": 2, "上級者向け": 3 }
end
