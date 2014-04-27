module StandupReportsHelper

  # Display Task Priority
  def display_priority(priority)
    priority = SettingsConfig::TASK_PRIORITY.key(priority)
    css_class =  is_high_priority(priority) ? "label-danger" : "label-warning"
    "<span class='label #{css_class}'>#{priority}</span>".html_safe
  end

  # Display Task Priority
  def display_task_status(status, inline_style=false)
    status = SettingsConfig::TASK_STATUS.key(status)
    css_class =  task_done?(status) ? "label-success" : "label-danger"
    "<span class='label #{css_class}'>#{status}</span>".html_safe
    if inline_style
      style = task_done?(status) ? 'color: #38761D' : 'color: #CC0000'
      "<span style='#{style};'>#{status}</span>".html_safe
    end
  end

end
