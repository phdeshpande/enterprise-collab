class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  def index
    @groups = Group.all
  end
   def show

  end
  def new
    @group = Group.new
  end
  def edit

  end
  def create

    @group = Group.new(group_params)
    respond_to do |format|
      if @group.save
        format.html {redirect_to groups_path, notice: 'Group created successfully' }
        
      else
        format.html {render action: 'new'}
      end
    end
  end

  def update
  respond_to do |format|
    if @group.update(group_params)
      format.html {redirect_to groups_path, notice: 'Group updated successfully' }
    else
      format.html {render action: 'edit' }
    end
  end
end
def destroy
  @group.destroy
  respond_to do |format|
    format.html { redirect_to groups_url }
  end
end

  private

  def set_group
    @group = Group.find(params[:id])
  end

 def group_params
      params.require(:group).permit(:name, :description, :owner, :created_at, :updated_at)
  end

end


