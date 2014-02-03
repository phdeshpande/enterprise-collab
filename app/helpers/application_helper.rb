module ApplicationHelper

  # Override Default behaviour to display error messages
  # Now Displaying as, <input field><span class="error">error msg</span>
  # Affecs input,select fields only
  ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    errors = Array(instance.error_message).join(',')
    if html_tag.match('input||select')
      %(<span class="state-error">#{html_tag}</span><span class="text-danger">&nbsp;#{errors}</span>).html_safe
    else
      %(#{html_tag}).html_safe
    end
  end
  
end
