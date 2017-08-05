class CreateProcessOfLessons < ActiveRecord::Migration
  def change
    create_table :process_of_lessons do |t|
      t.integer :user_to_course_id
      t.integer :lesson_id
      t.integer :point

      t.timestamps null: false
    end
  end
end
