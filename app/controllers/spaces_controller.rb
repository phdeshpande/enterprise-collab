class SpacesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @spaces = ApiTalk::Space.getSpaces
  end

  def team
    @space = ApiTalk::Space.getSpace(params[:id])
    team = ApiTalk::Space.getMembers(params[:id])
    @team = []
    team.each do |t|
      t['user'] = ApiTalk::User.getName(t['user_id']) # Get user details by user ID
      user = User.getPMUser(t['user_id'])
      t['standup_status'] = user.blank? ? 0 : StandupReport.get_report(user.id, Date.today, true) # Check if user has added stanup report for today
      @team.push(t)
    end
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
