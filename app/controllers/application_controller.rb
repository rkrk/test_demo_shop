class ApplicationController < ActionController::Base
  before_filter :need_login
  protect_from_forgery

  private
  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

  protected
  def need_login
    login_user = User.find_by_id(session[:user_id])
    if login_user
      if login_user.confirm == false
        redirect_to login_url, :notice => t('confirm_account')
      end
      #if login_user.role == 'admin'
      #  render "/admin/index"
      #else
      #  render "/store/category"
      #end
    else
      redirect_to login_url, :notice => t('login_first')
    end
  end

  def need_admin
    login_user = User.find_by_id(session[:user_id])
    if !(login_user.role == "admin")
      redirect_to login_url, :notice => t('login_as_an_admin')
    end
  end

end
