module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?
 
    messages = resource.errors.full_messages.map { |msg| content_tag(:p, msg) }.join
    sentence = I18n.t('errors.messages.not_saved',
      count: resource.errors.count,
      resource: resource.class.model_name.human.downcase)
 
    html = <<-HTML
    <div class="alert alert-danger alert-block">
      <a href="#" data-dismiss="alert" class="close">×</a>
      <h4 class="alert-heading">#{sentence}</h4>
      #{messages}
    </div>
    HTML
 
    html.html_safe
  end
end