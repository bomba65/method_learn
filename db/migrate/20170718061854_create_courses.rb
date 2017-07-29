class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :title
      t.string :subtitle
      t.string :description
      t.integer :language
      
      t.timestamps null: false
    end
  end
end
