class String
  def paragraphize
    ERB::Util.html_escape(self).gsub /^(.+)$/, '<p>\1</p>'
  end
end