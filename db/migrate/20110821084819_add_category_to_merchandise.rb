class AddCategoryToMerchandise < ActiveRecord::Migration
  def self.up
    add_column :merchandises, :category, :string
  end

  def self.down
    remove_column :merchandises, :category
  end
end
