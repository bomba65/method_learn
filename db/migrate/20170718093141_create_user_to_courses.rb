class CreateUserToCourses < ActiveRecord::Migration
  def change
    create_table :user_to_courses do |t|
      t.integer :user_id
      t.integer :course_id
      t.integer :progress, default: 0

      t.timestamps null: false
    end
    	add_index	:user_to_courses,	:user_id
    	add_index	:user_to_courses,	:course_id
    	add_index	:user_to_courses,	[:user_id,	:course_id],	unique:	true
  end
end
