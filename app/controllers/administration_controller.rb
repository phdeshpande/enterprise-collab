class AdministrationController < ApplicationController
  def index
   @users=User.all
   @user = User.new
  end 	

  def manage_users
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @administration }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def manage_accounts
  end

  private

  def user_params
      params.permit(:first_name, :last_name, :email)
    end
end
