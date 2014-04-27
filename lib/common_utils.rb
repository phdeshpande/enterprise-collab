module CommonUtils
  
  # Show Date in format as configured in SettingsConfig. By Default shows today's date
  # @params Date, String
  # @return Date
  def CommonUtils.date_format(date = Date.today, format = SettingsConfig::DATE_FORMAT)
    Time::DATE_FORMATS[:mine] = SettingsConfig::DATE_FORMAT
    Time.now.to_s(:mine) # TODO - Return only date
  end

  def CommonUtils.date_time_format(date_time = Date.today, format = SettingsConfig::DATE_FORMAT)
    "TODO - #{date}"
  end

end