module ApplicationHelper
  def title_tag_content
    title_tag_breadcrumbs.join ' » '
  end
end
