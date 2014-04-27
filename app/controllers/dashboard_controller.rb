class DashboardController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    # My Spaces
    @myspaces = []
    spaces = ApiTalk::Space.getSpaces
    user = User.select("id","pm_user_id_key").where(:id => current_user.id ).first
    spaces.each do |s|
      team = ApiTalk::Space.getMembers(s["id"])
      team.each do |t|
        # binding.pry
        @myspaces.push(s) if t['user_id'] == user.pm_user_id_key
      end
    end

    # Activity Stream
    @stream = ApiTalk::Stream.getActivity
  end

  def show
  end
  
  # List all Cron tasks
  def cron_tasks
  end

end
