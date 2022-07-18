module ApplicationHelper
  def render_flash_messages
    if flash[:notice]
      content_tag(:div, flash[:notice], class: 'alert alert-success')
    elsif flash[:alert]
      content_tag(:div, flash[:alert], class: 'alert alert-danger')
    end
  end
end
