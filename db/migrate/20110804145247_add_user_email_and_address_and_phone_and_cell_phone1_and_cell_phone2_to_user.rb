class AddUserEmailAndAddressAndPhoneAndCellPhone1AndCellPhone2ToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :user_email, :string
    add_column :users, :address, :string
    add_column :users, :phone, :string
    add_column :users, :cell_phone_1, :string
    add_column :users, :cell_phone_2, :string
  end

  def self.down
    remove_column :users, :cell_phone_2
    remove_column :users, :cell_phone_1
    remove_column :users, :phone
    remove_column :users, :address
    remove_column :users, :user_email
  end
end
