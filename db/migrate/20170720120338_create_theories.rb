class CreateTheories < ActiveRecord::Migration
  def change
    create_table :theories do |t|
      t.text :content
      t.string :video
      t.integer :lesson_id

      t.timestamps null: false
    end
  end
end
