class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :merchandise
  belongs_to :cart

  def total_price
    merchandise.price * quantity
  end
end
