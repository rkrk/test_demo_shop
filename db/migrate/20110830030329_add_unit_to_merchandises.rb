class AddUnitToMerchandises < ActiveRecord::Migration
  def self.up
    add_column :merchandises, :unit, :string
  end

  def self.down
    remove_column :merchandises, :unit
  end
end
