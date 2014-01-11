class HomeController < ApplicationController
  layout "application"

  def index
    render :layout => "login"
  end

  def list
  end  

end
