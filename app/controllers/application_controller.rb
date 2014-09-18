class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :title_tag_breadcrumbs

  def title_tag_breadcrumbs
    @title_tag_breadcrumbs ||= %w(GL•B)
  end
end
