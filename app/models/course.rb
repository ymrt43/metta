class Course < ApplicationRecord
  has_many :lessons
  
  validates :course_name, :introduction, :src, presence: true
end
