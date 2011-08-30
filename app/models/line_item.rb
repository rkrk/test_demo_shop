class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :merchandise
  belongs_to :cart

  def line_item_total_price
    (merchandise.promoted_price == nil) ? (merchandise.price * quantity) : (merchandise.promoted_price * quantity)
  end
end
