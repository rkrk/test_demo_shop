class AddHashedAddressAndRoleToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :hashed_address, :string
    add_column :users, :role, :string
  end

  def self.down
    remove_column :users, :role
    remove_column :users, :hashed_address
  end
end
