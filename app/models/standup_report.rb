class StandupReport < ActiveRecord::Base
  belongs_to :user
  belongs_to :account

  validates :task_name, :presence => true

  def self.get_report(current_user, date)
    conditions = ["creator_id = ?", current_user.id]
    conditions[0] += " AND date(created_at) = '#{date}'"
    # binding.pry
    StandupReport.where(conditions) #.load
  end

  def self.create_standup_report(params, current_user)
    standup_report = StandupReport.new(params)
    standup_report.account_id = current_user.account_id
    standup_report.creator_id = current_user.id
    standup_report.status = true
    # binding.pry
    standup_report
  end

end
