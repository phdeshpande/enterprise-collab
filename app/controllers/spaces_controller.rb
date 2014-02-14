class SpacesController < ApplicationController
  before_filter :authenticate_user!

  def index
    api = 'spaces' # Space URI    
    @spaces = callAPI(api)
  end
end
