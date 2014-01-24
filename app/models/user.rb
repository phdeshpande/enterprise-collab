class User < ActiveRecord::Base
	validates :username, :presence =>true
	validates_confirmation_of :email, :uniqueness => true, :presence =>true
	validates :firstname, :presence =>true
	validates_length_of :password, :presence =>true, within: 6..20
end
