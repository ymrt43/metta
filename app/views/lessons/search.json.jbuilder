json.array! @lessons do |lesson|
  json.id lesson.id
  json.level lesson.level
  json.capacity lesson.capacity
  json.date lesson.date
  json.start_time lesson.start_time
  json.end_time lesson.end_time
  json.fee lesson.fee
  json.lesson_introduction lesson.lesson_introduction
  json.course_id lesson.course_id
  json.coursename lesson.course.course_name
  json.fully_booked lesson.fully_booked
end