class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_filter :authenticate_user!, :except => [:home]
  before_filter :configure_permitted_parameters, if: :devise_controller?

  # Override the after sign in path set by Devise
  def after_sign_in_path_for(resource_or_scope)
    dashboard_index_path
  end

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name]
  end

  # Calls assembla API
  # @params: api(string)
  # @return: json(success), nil(error)
  def callAPI(api)
    uri = AppConfig::pm_config['url']+'/'+AppConfig::pm_config['version']+'/'+api
    request_data  = HTTParty.get(uri, :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json', 
                  "X-Api-Key" => AppConfig::pm_config['api_key'], "X-Api-Secret" => AppConfig::pm_config['api_secret_key']} )
    if request_data.response.code != "200"
      # flash[:alert] = request_data.response.code + " - " + request_data.response.message
      raise "Something went wrong"
      Rails.logger("API call failed to #{uri}. Response returned is #{request_data.response.code} - request_data.response.message")
    end
    request_data
  end  

end