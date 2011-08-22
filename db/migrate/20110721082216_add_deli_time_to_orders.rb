class AddDeliTimeToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :deli_time, :string
  end

  def self.down
    remove_column :orders, :deli_time
  end
end
