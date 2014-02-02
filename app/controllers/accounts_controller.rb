class AccountsController < ApplicationController
  layout 'public'
  before_action :set_account, only: [:show, :edit, :update]

  def show
  end

  def new
    @account = Account.new
  end

  def edit
  end

  def activate
    
  end

  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
      else
        format.html { render action: 'new' }
        end
    end
  end

  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        
      else
        format.html { render action: 'edit' }
       
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:company, :subdomain, :address, :city, :state, :zipcode, :country, :office, :mobile, :status)
    end
end
