class StandupReportsController < ApplicationController
  before_filter :authenticate_user!

  # List Standup Report for the logged-in user
  def index
    standup = StandupReport.get_report(current_user.id, Date.today) # Get today's standup Report
    @standup_tasks = build_standup_report_hash(standup)
    @last_eod_report = StandupReport.get_report(current_user.id, Date.yesterday) # Get yday's standup Report
  end

  # New Standup Report Task
  def new
    @standup = StandupReport.new
    @spaces = ApiTalk::Space.getSpaces
    # binding.pry
    render :layout => false
  end

  # Create Standup Report
  def create
    standup = StandupReport.create_standup_report(standup_report_params, current_user)
    begin
      standup.save!
      flash[:success] = "Task was added successfully!"
      @standup_tasks = build_standup_report_hash(standup)
      # @standup = Standup.new # Needed for form in Modal 
      # binding.pry
    rescue
      @standup = StandupReport.new(standup_report_params)
      @spaces = ApiTalk::Space.getSpaces
      flash[:alert] = "Task creation failed!"
    end
  end

  # Edit Standup Report Task
  def edit
    @standup = StandupReport.find(params[:id])
    @spaces = ApiTalk::Space.getSpaces
    # binding.pry
    render :layout => false
  end

  # Update Standup Report Task
  def update
    standup = StandupReport.find(params[:id])
    begin
    standup.update_attributes(standup_report_params)
    standup = StandupReport.get_report(current_user, Date.today) # Get today's standup Report
    @standup_tasks = build_standup_report_hash(standup)
    flash[:success] = "Task was updated successfully!"
    rescue => e
      @standup = StandupReport.find(params[:id])
      @spaces = ApiTalk::Space.getSpaces
      flash[:alert] = "There was a problem updating the task"
    end
  end

  def show
    @standup = StandupReport.find(params[:id])
    @spaces = ApiTalk::Space.getSpaces
    render :layout => false
  end

  def destroy
    @spaces = ApiTalk::Space.getSpaces
    begin
      standup = StandupReport.destroy(params[:id])
      standup = StandupReport.get_report(current_user, Date.today) # Get today's standup Report
      @standup_tasks = build_standup_report_hash(standup)
      flash[:success] = "Task was deleted successfully!"
    rescue
      flash[:alert] = "There was a problem deleting the task"
    end
  end

  def daily_email
    spaces = ApiTalk::Space.getSpaces
    spaces.each do |s|
    # For each space get Standup Report for all users
    standup_reports = StandupReport.get_by_space(s["id"], Date.today)
    standup_tasks = {}
    standup_reports.each do |su_report|
      user_name = su_report.user.first_name
      standup_tasks[user_name] = [] if standup_tasks[user_name].blank?
      standup_tasks[user_name].push(su_report)
    end

    # binding.pry
      team_members = {}
      # Send email to the team members
      team = ApiTalk::Space.getMembers(s["id"])
      # binding.pry
      team.each do |t|
        user = ApiTalk::User.getName(t['user_id']) # Get user details by user ID from PM Tool
        # user = User.getPMUser(t['user_id'])
        team_members = { user['name'] => user['email'] }
        # binding.pry
      end
      StandUpReportMailer.standup_report_email(s, team_members, standup_tasks).deliver # Trigger email for each space
    end
  end
 
  ###############################################################################################################
  private
  ###############################################################################################################

  # Permit parameters
  def standup_report_params
    params.require(:standup_report).permit(:task_name, :description, :status, :priority, :eta, :actual_time, :comments, :category_id, :space_id, :creator_id)
  end

  # Build Standup Report Hash for Listing
  # @param standup_report_ar
  # @return Hash (standup tasks with space name)
  def build_standup_report_hash(standup)
    standup = StandupReport.get_report(current_user, Date.today) # Get today's standup Report
      standup_tasks = {}
      spaces = {}
      standup.each do |su_report|
        # Get space name
        spaces[su_report.space_id] = ApiTalk::Space.getSpace(su_report.space_id) unless spaces.keys.include?(su_report.space_id) # Call only if space details were not fetched for this space_id
        space_name = spaces[su_report.space_id]['name']
        # binding.pry
        if standup_tasks[space_name].blank?
          standup_tasks[space_name] = [su_report] 
        else
          standup_tasks[space_name].push(su_report)
        end
        # binding.pry
      end
    standup_tasks
  end


end
