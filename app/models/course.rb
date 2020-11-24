class Course < ApplicationRecord
  has_many :lessons
  mount_uploader :src, ImageUploader
  validates :course_name, :introduction, :src, presence: true
end
