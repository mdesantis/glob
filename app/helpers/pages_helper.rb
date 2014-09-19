module PagesHelper
  def page_content(page)
    content = page.content

    return content unless content

    case page.markup
    when Page::Markups::PARAGRAPHS
      ERB::Util.html_escape(content).gsub(/^(.+)$/, '<p>\1</p>').html_safe
    when Page::Markups::HTML
      content.html_safe
    end
  end
end