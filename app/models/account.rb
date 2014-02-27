class Account < ActiveRecord::Base
  has_many :users, :dependent => :destroy

  validates :company_name, :presence => true, uniqueness :true
end
