# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title(page_title)
    content_for(:title) { h(page_title) }
  end  
  
  def br(text)
    h(text).gsub!(/\n/, '<br />')
  end
end