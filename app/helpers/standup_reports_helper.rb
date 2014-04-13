module StandupReportsHelper

  # Display Task Priority
  def display_priority(priority)
    priority = SettingsConfig::TASK_PRIORITY.key(priority)
    css_class =  is_high_priority(priority) ? "label-danger" : "label-warning"
    "<span class='label #{css_class}'>#{priority}</span>".html_safe
  end

  # Display Task Priority
  def display_task_status(status)
    status = SettingsConfig::TASK_STATUS.key(status)
    css_class =  task_done?(status) ? "label-success" : "label-danger"
    "<span class='label #{css_class}'>#{status}</span>".html_safe
  end

end
