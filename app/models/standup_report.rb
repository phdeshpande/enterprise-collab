class StandupReport < ActiveRecord::Base
  belongs_to :user, :foreign_key => :creator_id
  belongs_to :account

  validates :task_name, :presence => true

  # Get Standup Reports for the user
  def self.get_report(user_id, date, test=false)
    conditions = ["creator_id = ?", user_id]
    conditions[0] += " AND date(created_at) = '#{date}'"
    if test # Just check if atleast 1 task added
      StandupReport.where(conditions).limit(1)
    else
      standup = StandupReport.where(conditions).order("creator_id")
    end
  end

  # Get all standup reports for a space
  def self.get_by_space(space_id, date=Date.today)
    conditions = ["space_id = ?", space_id]
    conditions[0] += " AND date(created_at) = '#{date}'"
    StandupReport.where(conditions).load
  end

  def self.create_standup_report(params, current_user)
    standup_report = StandupReport.new(params)
    standup_report.account_id = current_user.account_id
    standup_report.creator_id = current_user.id
    standup_report.status = true
    standup_report
  end

end
