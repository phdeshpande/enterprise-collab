class HomeController < ApplicationController
   layout "public"

  before_filter :authenticate_user, :only => []
  before_filter :save_login_state, :only => [:index, :login_attempt]
  
  def index
  end

  def register
  end

  def show 
  end

  def loginattempt
  	 authorized_user = User.authenticate(params[email],params[loginpassword])
    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
      redirect_to(:action => '/dashboard')
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "index"	
    end
  end

  def logout
  session[:user_id] = nil
  redirect_to :action => 'index'
  end
  
end
