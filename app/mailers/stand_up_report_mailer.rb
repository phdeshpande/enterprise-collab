class StandUpReportMailer < ActionMailer::Base
  helper 'Application'
  helper 'StandupReports'
  default from: "no-reply@hutgeeks.com"

  def standup_report_email(space, team_members, standup_tasks, date=Date.today)
    @date = date
    @space = space
    @standup_tasks = standup_tasks
    # recipients = team_members.values
    recipients = ["purushottam@hutgeeks.com", "bornfreeparry@gmail.com"] # Test data
    # members.each do |m|
    #   team_members.push(m['email_id'])
    # end
    # team_members = team_members.join(",")
    # binding.pry
    from = "no-reply@#{space['name'].downcase.tr(' ', '-')}.com"
    mail(from: from ,to: recipients, :subject => "#{date} - #{space['name']} StandUp Report", :content_type => "text/html")
  end
end
