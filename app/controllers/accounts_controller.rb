class AccountsController < ApplicationController
  before_filter :authenticate_user!

 
  # # Add a user by Admin
  # def new_user
  #   @users = User.all
  #   # render :text => "Add User", :layout => "application"
  # end  

  def edit
    
  end

  # List all Cron tasks
  def cron_tasks
    
  end

end
