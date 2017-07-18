class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.text :description
      t.integer :part_id
      t.integer :lesson_order
      t.string :video
      t.text :theory

      t.timestamps null: false
    end
  end
end
