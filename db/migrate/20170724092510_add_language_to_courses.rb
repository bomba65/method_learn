class AddLanguageToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :language, :integer
  end
end
