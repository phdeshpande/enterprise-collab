class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :authenticate_user!, :except => [:index, :create]
  layout "public"

  # Create User & Account after signup
  def create
    super
    acc = Account.create!(:company_name => params[:account][:company_name]) unless flash.blank?
    # Set admin and account_id for User       
    resource.update_attributes!({:account_id => acc.id, :is_admin => true, :status => SettingsConfig::ENABLED}) unless flash.blank?
  end

end