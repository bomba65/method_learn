class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.integer :lesson_id
      
      t.timestamps null: false
    end
  end
end
