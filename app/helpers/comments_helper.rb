module CommentsHelper
  def comment_content(comment)
    content = comment.content

    return content unless content

    content.paragraphize.html_safe
  end
end