class StandupReportsController < ApplicationController
  before_filter :authenticate_user!

  # List Standup Report for the logged-in user
  def index
    @standup = StandupReport.get_report(current_user.account_id, Date.today) # Get today's standup Report
    binding.pry
  end


end
