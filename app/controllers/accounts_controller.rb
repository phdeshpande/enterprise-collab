class AccountsController < ApplicationController
  before_filter :authenticate_user!

 
  # # Add a user by Admin
  # def new_user
  #   @users = User.all
  #   # render :text => "Add User", :layout => "application"
  # end  

end
