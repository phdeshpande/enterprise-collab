class Account < ActiveRecord::Base
  has_many :users, :dependent => :destroy
  has_many :groups, :dependent => :destroy
  has_many :standup_reports, :dependent => :destroy

  validates :company_name, :presence => true
end
