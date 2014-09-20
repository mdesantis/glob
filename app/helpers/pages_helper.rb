module PagesHelper
  def page_content(page)
    content = page.content

    return content unless content

    case page.markup
    when Page::Markups::PARAGRAPHS
      content.paragraphize.html_safe
    when Page::Markups::HTML
      content.html_safe
    when Page::Markups::MARKDOWN
      Kramdown::Document.new(content, auto_id_prefix: "#{page.slug}-").to_html.html_safe
    end
  end
end