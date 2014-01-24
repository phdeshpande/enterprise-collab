class UsersController < ApplicationController
  layout 'public'
  before_action :set_user, only: [:show]

  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    @activation_key=Array.new(16){[*'0'..'9',*'a'..'z',*'A'..'Z'].sample}.join
    @user.activation_key=@activation_key

    respond_to do |format|
      if @user.save
         UserMailer.welcome_email(@user).deliver!
        format.html { redirect_to @user }
      else
        format.html { render action: 'new' }        
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :confirmpassword, :firstname, :lastname, :gender, :request, :subscription, :terms)
    end
end
