class Cart < ActiveRecord::Base
  has_many :line_items, :dependent=>:destroy

  def add_product(merchandise_id, quantity)
    current_item = line_items.find_by_merchandise_id(merchandise_id)
    if current_item
      current_item.quantity += quantity
    else
      current_item = line_items.build(:merchandise_id => merchandise_id)
      #As lineitem first time "add to cart" .+ 1 only  bug ; quantity default 1
      current_item.quantity += (quantity - 1)

    end
    current_item
  end


  def cart_total_price
    line_items.to_a.sum { |item| item.line_item_total_price }
  end

end
