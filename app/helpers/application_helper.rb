module ApplicationHelper
  def menu_item( name, path, options = {} )
    options[:class] = "active" if current_page?(path)
    content_tag(:li, link_to(name, path), options)
  end
end
