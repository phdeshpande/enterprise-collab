class User < ActiveRecord::Base
  belongs_to :account
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable
         :confirmable

  validates :first_name,:last_name, :email, :presence => true
  validates :password, :presence => true, :on => :create

  # Creates a User
  def self.create_user(user_params, account_id)
    user = User.new(user_params)
    user.account_id = account_id
    user.is_admin = false
    user
  end

  # Get all users under current account_id
  def self.get_all(account_id)
    User.where(:account_id => account_id)
  end


end