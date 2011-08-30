class AddModelNumberToMerchandises < ActiveRecord::Migration
  def self.up
    add_column :merchandises, :model_number, :string
  end

  def self.down
    remove_column :merchandises, :model_number
  end
end
