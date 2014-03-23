class StandupsController < ApplicationController
 before_action :set_standup, only: [:show, :edit, :update, :destroy]
  def index
    @standups = Standup.all
  end
   def show

  end
  def new
    @standup = Standup.new
  end
  def edit

  end
  def create

    @standup = Standup.new(standup_params)
    respond_to do |format|
      if @standup.save
        format.html {redirect_to standups_path, notice: 'Standup report created successfully' }
        
      else
        format.html {render action: 'new'}
      end
    end
  end

  def update
  respond_to do |format|
    if @standup.update(standup_params)
      format.html {redirect_to standups_path, notice: 'Standup report updated successfully' }
    else
      format.html {render action: 'edit' }
    end
  end
end
def destroy
  @standup.destroy
  respond_to do |format|
    format.html { redirect_to standups_url }
  end
end

  private

  def set_standup
    @standup = Standup.find(params[:id])
  end

 def standup_params
      params.require(:standup).permit(:task_name, :space_id, :eta, :actual_time, :category_id, :status, :comments, :account_id)
  end
end
