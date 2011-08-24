class StoreController < ApplicationController
  before_filter :need_login  ,:except => ["index"]

  def index
    #@store_shorrent_cart
    #@new_line_item w_merchandise = Merchandise.all
    #@cart = cu= LineItem.new
  end

  def category
    @category = Category.all
    @store_show_merchandise = Merchandise.all
    @cart = current_cart
    @new_line_item = LineItem.new
  end

  def order_history
    @user_info = User.find(session[:user_id])
    @order_history = Order.where(:email => @user_info.user_email).page(params[:page]).per(10)

  end

  def show_lineitem_history
    @lineitem_history = LineItem.find_all_by_order_id(params[:order_id])
  end

end

