class CreateMerchandises < ActiveRecord::Migration
  def self.up
    create_table :merchandises do |t|
      t.string :merchandise_name
      t.float :price
      t.string :image_url
      t.string :merchandise_detail
      t.integer :production_month_from
      t.integer :production_month_to
      t.string :origin

      t.timestamps
    end
  end

  def self.down
    drop_table :merchandises
  end
end
