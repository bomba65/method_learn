class AddAvatarColumnsToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :avatar, default
    end
  end

  def self.down
    drop_attached_file :users, :avatar
  end
end