class GroupsController < ApplicationController
  before_filter :authenticate_user!

  # List all Groups for account
  def index
    @groups = Group.get_all(current_user.account_id)
  end

  # New Group Form
  def new
    @group = Group.new
    @users = User.get_all(current_user.account_id)
  end

  # Create Group
  def create
    # binding.pry
    @group = Group.create_group(group_params, current_user.account_id)
    @users = User.get_all(current_user.account_id)
    begin
      @group.save!
      flash[:success] = "Group was created successfully!"
      @groups = Group.get_all(current_user.account_id)
    rescue
      flash[:alert] = "Group creation failed!"
    end
  end

  # Edit Group form
  def edit
    @group = Group.where(:id => params[:id]).first
    @users = User.get_all(current_user.account_id)
  end

  # Update Group
  def update
    @group = Group.where(:id => params[:id]).first
    # binding.pry
    @users = User.get_all(current_user.account_id)
    begin
      # params['group']['member_ids'] = Group.array_to_csv(params['group']['member_ids'])
      @group.update_attributes!(group_params) 
      @groups = Group.get_all(current_user.account_id)
      flash[:succes] = "Group details updated successfully!"
    rescue => e
      flash[:alert] = "There was a problem updating the group details"
    end
  end

  def destroy
   @group = Group.where(:id=>params[:id]).first
   begin
    @group.destroy
    @groups = Group.get_all(current_user.account_id)
    flash[:succes] = "Group deleted successfully!"
    rescue 
      @users = User.get_all(current_user.account_id)
      flash[:alert] = "There was a problem in deleting the group"
    end
    # render :index, :groups => @groups
    # respond_to do |format|
    #   format.html { redirect_to groups_url }
    #   format.json { head :no_content }
    # end
  end
  ###############################################################################################################
  private
  ###############################################################################################################

  # Permit parameters
  def group_params
    params.require(:group).permit(:name, :description, :status, :user_id, :member_ids => [])
  end

end
