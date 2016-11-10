module ApplicationHelper
  
  def active_class_for(path)
    "active" if current_page?(path)
  end
  
end
