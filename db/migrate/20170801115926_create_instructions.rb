class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.text :content
      t.integer :lesson_id

      t.timestamps null: false
    end
  end
end
