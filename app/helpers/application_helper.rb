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

  # Return page title
  # @params string, string
  # @return html_string
  def page_title(title, action)
    action = (action == "index") ? "Home" : action
    "#{title.camelize} <span>&gt; #{action.humanize} </span>".html_safe
  end  

  # Checks if set to ENABLED/DISABLED value
  # @param Integer
  # @return Bool
  def enabled?(status)
    return (status == SettingsConfig::ENABLED)
  end

  ###############################################################################
  # TBootstrap Helper Methods
  ###############################################################################

  # Wraps the input fields with html tags around the input field
  # The Ouptut is a tag structure based on "SmartAdmin" Template Form
  def wrap_input_field(field, icon="") #field, label=nil, error_msg = "", hint_text=nil
    content_tag(:label, class:'input') do
      if icon.blank?
        field.html_safe
      else
        content_tag(:i, "", class:"icon-prepend #{icon}") + field.html_safe 
      end
    end 
  end


  #######################################################################################
  # Form Helper Methods
  #######################################################################################

  # Build User select options
  # @params UserObject
  # @returns Array
  def options_for_user_select(object)
    object.collect { |r| [r.name, r.id] }
  end

  ###########################################################################
  # Privileges
  ###########################################################################
  def is_admin?
    current_user.is_admin
  end

  
end
