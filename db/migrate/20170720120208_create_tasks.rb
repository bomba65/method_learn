class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :content
      t.string :answer
      t.integer :lesson_id

      t.timestamps null: false
    end
  end
end
