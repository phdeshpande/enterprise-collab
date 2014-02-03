class User < ActiveRecord::Base
  belongs_to :account
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable
         :confirmable

  validates :first_name,:last_name, :presence => true
end
