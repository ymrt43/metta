class Reservation < ApplicationRecord
  belongs_to :lesson
  belongs_to :user

  validates :count, presence: true

  def number_of_participants(lesson_id)
    participants = Reservation.where(lesson_id: lesson_id).sum("count")
    return participants
  end
end
