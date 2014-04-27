class User < ActiveRecord::Base
  belongs_to :account
  has_many   :standup_reports

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable
         :confirmable

  validates :first_name,:last_name, :presence => true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
  validates :password, :presence => true, :on => :create

  # Attributes
  def name
    self.first_name + " " + self.last_name
  end

  # Creates a User
  def self.create_user(user_params, account_id)
    user = User.new(user_params)
    user.account_id = account_id
    user.is_admin = false
    user
  end

  # Get User
  def self.getPMUser(pm_user_id_key)
    User.where(:pm_user_id_key => pm_user_id_key).load.first
  end

  # Get all users under current account_id
  def self.get_all(account_id)
    User.where(:account_id => account_id)
  end


end