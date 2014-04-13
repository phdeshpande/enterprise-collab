class SpacesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @spaces = ApiTalk::Space.getSpaces
  end

  # List Milestones based on space ID & filters passed as per Assembla API ref
  # @params space_id, filter(all, "")
  def milestones
    milestone_api = "spaces/#{params[:id]}/milestones/#{params[:filter]}" # All Milestones
    space_api = "spaces/#{params[:id]}"
    @milestones = ApiTalk::callAPI(milestone_api)
    @space = ApiTalk::Space.getSpaces(space_api)
  end
end
