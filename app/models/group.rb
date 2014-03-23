class Group < ActiveRecord::Base
  belongs_to :account
  belongs_to :user

  # validates :name, :description, :presence => true
  validates :name, length: 1..50
  validates :description, length: 5..200


  def self.get_all(account_id=nil)
    account_id.blank? ? Group.all : Group.where(:account_id => account_id)
  end

  def self.create_group(params, account_id)
    group = Group.new(params)
    group.account_id = account_id
    group.status = true
    group
  end

end
