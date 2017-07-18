class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :name
      t.integer :course_id

      t.timestamps null: false
    end
  end
end
