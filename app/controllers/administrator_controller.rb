class AdministratorController < ApplicationController
  def index
  	@admins = User.all
  end
end
