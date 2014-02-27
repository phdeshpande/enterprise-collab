class AdministrationController < ApplicationController
  def index
   @users=User.all
  end 	

  def manage_users
  end

  def manage_accounts
  end

  def create
   
  end	
end
