class CreateCourseToCategories < ActiveRecord::Migration
  def change
    create_table :course_to_categories do |t|
      t.integer :course_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
