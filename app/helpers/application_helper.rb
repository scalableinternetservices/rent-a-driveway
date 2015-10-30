module ApplicationHelper

def header(text)
	content_for(:header) {text.to_s }
end


  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, { :sort => column, :direction => direction }, { :class => css_class }
  end
end
