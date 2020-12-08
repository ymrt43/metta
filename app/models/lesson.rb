class Lesson < ApplicationRecord
  has_many :reservations
  belongs_to :course

  validates :level, :capacity, :date, :start_time, :end_time, :fee, presence: true

  enum level: { "初心者向け": 1, "中級者向け": 2, "上級者向け": 3 }

  scope :incoming, -> { where('date > ?', Time.zone.now) }

  def lesson_duration
    duration = (self.end_time - self.start_time) / 60
    duration_h = (duration / 60).floor
    duration_m = (duration % 60).round
    if duration >= 60 && duration_m == 0
      return "#{duration_h}時間"
    elsif duration >= 60
      return "#{duration_h}時間#{duration_m}分"
    else
      return "#{duration.round}分"
    end
  end

  def self.search(search)
    if search != ""
      Lesson.incoming.where(course_id: search)
    else
      Lesson.incoming
    end
  end

  def update_fully_booked
    self.fully_booked = true if self.fully_booked == false
    self.save
  end

end
