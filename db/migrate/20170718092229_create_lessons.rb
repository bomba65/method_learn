class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.integer :part_id
      t.integer :lesson_order

      t.timestamps null: false
    end
  end
end
