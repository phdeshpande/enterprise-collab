module CommonUtils
  
  def CommonUtils.date_format(date = Date.today, format = SettingsConfig::DATE_FORMAT)
    Time::DATE_FORMATS[:mine] = SettingsConfig::DATE_FORMAT
    Time.now.to_s(:mine)
  end

  def CommonUtils.date_time_format(date_time = Date.today, format = SettingsConfig::DATE_FORMAT)
    "TODO - #{date}"
  end

end