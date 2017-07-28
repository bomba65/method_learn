class AddExistCodeToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :exist_code, :text
  end
end
