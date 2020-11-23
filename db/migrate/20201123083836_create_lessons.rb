class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.integer :level, null: false
      t.integer :capacity, null: false
      t.date :date, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.integer :fee, null: false
      t.text :lesson_introduction
      t.references :course, null: false, foreign_key: true
      t.boolean :fully_booked, null: false, default: false
      t.timestamps
    end
    add_index :lessons, :lesson_introduction, length: 50
  end
end
