class StandupReport < ActiveRecord::Base

  def self.get_report(id, date)
    conditions = {:creator_id => id}
    conditions[:created_at] = date
    StandupReport.where(conditions)
  end

end
