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
    member_ids = params[:member_ids].collect{|m| m.join(',')}
    group = Group.new(params)
    group.account_id = account_id
    group.status = true
    group
  end

  # Convert array to CSV
  # @param Array [1,2,3]
  # @returns String "1,2,3"
  def self.array_to_csv(arr)
    arr.delete("")
    arr.join(",")
  end

end
