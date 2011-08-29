class RegisterController < ApplicationController
skip_before_filter :need_login


  def index
	 @user = User.new
  end

  def confirm
    @user = User.find_by_hashed_address(params[:hash])
    @user.confirm = "true"

    if @user.save
      flash[:notice] = "User #{@user.name} confirmed!"
    else
      flash[:notice] = "User confirm failed! Try again please."
    end

    redirect_to store_url
  end
end
