class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :course_name, null: false, index: true
      t.text :introduction, null: false
      t.string :src
      t.timestamps
    end
  end
end
