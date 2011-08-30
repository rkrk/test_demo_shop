class AddPromotedPriceToMerchandises < ActiveRecord::Migration
  def self.up
    add_column :merchandises, :promoted_price, :float
  end

  def self.down
    remove_column :merchandises, :promoted_price
  end
end
