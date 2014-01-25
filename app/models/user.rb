class User < ActiveRecord::Base
	validates :username, :presence =>true
	validates_format_of  :email, :presence => true,:uniqueness => true, :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ 
        
	validates :firstname, :presence =>true
	validates :password, :presence => true, :confirmation => true, :length => {:within => 6..20}, :on => :create
    validates :terms, acceptance: true
end
