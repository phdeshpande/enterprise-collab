class User < ActiveRecord::Base
  belongs_to :account
  has_and_belongs_to_many :roles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable
         :confirmable

  validates :first_name,:last_name, :presence => true

  
  #def activate_account!
   #update_attribute :is_active, true
 #end
end
#in rails application i want an admin user to create users and send invitation to those users to sign-in into account