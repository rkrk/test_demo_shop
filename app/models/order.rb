class Order < ActiveRecord::Base
  
  PAYMENT_TYPES = [ "C.O.D", "Credit card", "Purchase order" ]
  DELI_TIME = ["04:00~07:00","07:00~12:00","13:00~17:00","17:00~20:00"]
  #ORDER_STATUS = ["","Checked","Completed"]

  
  has_many :line_items, :dependent => :destroy
  belongs_to :user
  
  
  @today = Date.today.strftime("%Y-%m-%d")
  @yesterday = (Date.today - 1).strftime("%Y-%m-%d")

  @line_item = LineItem.all
  
  scope :today, where("deli_day" => @today) 
  scope :yesterday, where("deli_day" => @yesterday)

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
