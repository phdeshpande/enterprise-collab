class UsersController < ApplicationController
  before_filter :authenticate_user!

  # List users
  def index
    @users = User.get_all(current_user.account_id)
  end

  # Show New User form
  def new
    @user = User.new
  end

  # Create New User for an account - Sys
  def new_user_create
    @user = User.create_user(user_params, current_user.account_id) # New User
    begin
      @user.save!
      @users = User.get_all(current_user.account_id)
      flash[:success] = "User was created successfully!"
    rescue => e
      flash[:alert] = "User creation failed!"
    end    
  end

  # Edit a user
  def edit
    @user = User.where(:id => params[:id]).first
  end

  def update
    @user = User.where(:id => params[:id]).first
    params[:users].delete(:password) if params[:users][:password].blank?
    begin
      @user.update_attributes!(user_params) 
      @users = User.get_all(current_user.account_id)
      flash[:succes] = "User details updated successfully!"
    rescue => e
      flash[:alert] = "There was a problem updating the user details"
    end
  end

  ###############################################################################################################
  private
  ###############################################################################################################

  # Permit parameters
  def user_params
    params.require(:users).permit(:first_name, :last_name, :email, :dob, :mobile_number,:work_number, :residence_address, :status, :password, :password_confirmation, :pm_user_id_key)
  end

end
