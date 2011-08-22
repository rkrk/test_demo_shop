class AddConfirmToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :confirm, :boolean, :default => 0
  end

  def self.down
    remove_column :users, :confirm
  end
end
