class SessionsController < ApplicationController
  skip_before_filter :need_login

  def new
  end

  def create
    if User.find_by_user_email(params[:name]).confirm == true
      if user = User.authenticate(params[:name], params[:password])
        session[:user_id] = user.id
        if User.is_admin?(params[:name])
          redirect_to admin_url
        else
          redirect_to store_url
        end
      else
        redirect_to login_url, :alert => "Invalid user/password combination"
      end
    else
      redirect_to login_url, :alert => "Please confirm your id first!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_url, :notice => "Logged out"
  end

end
