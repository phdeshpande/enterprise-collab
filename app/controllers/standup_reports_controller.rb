class StandupReportsController < ApplicationController
  before_filter :authenticate_user!

  # List Standup Report for the logged-in user
  def index
    @standup_tasks = StandupReport.get_report(current_user, Date.today) # Get today's standup Report
    @last_eod_report = StandupReport.get_report(current_user, Date.yesterday) # Get yday's standup Report
    # binding.pry
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
      @standup_tasks = StandupReport.get_report(current_user, Date.today) # Get today's standup Report
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
    @standup_tasks = StandupReport.get_report(current_user, Date.today) # Get today's standup Report
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
      @standup_tasks = StandupReport.get_report(current_user, Date.today) # Get today's standup Report
      flash[:success] = "Task was deleted successfully!"
    rescue
      flash[:alert] = "There was a problem deleting the task"
    end
  end

  ###############################################################################################################
  private
  ###############################################################################################################

  # Permit parameters
  def standup_report_params
    params.require(:standup_report).permit(:task_name, :description, :status, :priority, :eta, :actual_time, :comments, :category_id, :space_id, :creator_id)
  end


end
