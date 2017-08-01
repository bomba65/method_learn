class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :answer
      t.integer :lesson_id
      t.text :invisible_code

      t.timestamps null: false
    end
  end
end
