class AdministrationController < ApplicationController
  def index
   @users=User.all
  end 	

  def manage_users
  end

  def manage_accounts
  end

  def new
  	@member = User.new
  end

  def create
   @member = User.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to @administration }
      else
        format.html { render action: 'new' }
      end
    end
  end	

  private

  def product_params
      params.require(:product).permit(:title, :description, :price)
    end
end
