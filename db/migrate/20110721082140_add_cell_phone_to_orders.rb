class AddCellPhoneToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :cell_phone, :string
  end

  def self.down
    remove_column :orders, :cell_phone
  end
end
