class User < ActiveRecord::Base
attr_accessor :password
    EMAIL_REGEX =/[A-Za-z_]+[A-Za-z.0-9_]*@[a-z.-]+\.[a-z]{2,4}/
	  validates :username, presence: true, uniqueness: true
    validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
    validates :firstname, :presence =>true
    validates :request, :presence =>true
    #validates :terms, acceptance: true
    validates :password, :presence => true, :confirmation => true 
    validates_length_of :password, :in => 6..20, :on => :create

    before_save :encrypt_password
    after_save :clear_password

def encrypt_password
  if password.present?
    self.salt = BCrypt::Engine.generate_salt
    self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
  end
end

def clear_password
  self.password = nil
end


def self.authenticate(email="", loginpassword="")
  if  EMAIL_REGEX.match(email)    
    user = User.find_by_email(email)
  end

  if user && user.match_password(loginpassword)
    return user
  else
    return false
  end
end
   
def match_password(loginpassword="")
  encrypted_password == BCrypt::Engine.hash_secret(loginpassword, salt)
end

attr_accessible :username, :email, :password, :password_confirmation, :firstname, :lastname, :gender, :request, :subscription, :terms

end
