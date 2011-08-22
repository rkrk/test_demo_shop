class AddDeliDayToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :deli_day, :date
  end

  def self.down
    remove_column :orders, :deli_day
  end
end
