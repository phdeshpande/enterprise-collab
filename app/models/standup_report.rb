class StandupReport < ActiveRecord::Base
  belongs_to :user
  belongs_to :account

  validates :task_name, :presence => true

  def self.get_report(user_id, date, test=false)
    conditions = ["creator_id = ?", user_id]
    conditions[0] += " AND date(created_at) = '#{date}'"
    if test # Just check if atleast 1 task added
      StandupReport.where(conditions).limit(1)
    else
      StandupReport.where(conditions)
    end
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
