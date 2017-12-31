class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :title_tag_breadcrumbs

  def self.admin_username
    ENV['GLOB_USERNAME'].tap do |username|
      if username.blank?
        raise 'Admin username is not set. Please set using GLOB_USERNAME' \
              ' environment variable.'
      end
    end
  end

  def self.admin_password
    ENV['GLOB_PASSWORD'].tap do |password|
      if password.blank?
        raise 'Admin password is not set. Please set using GLOB_PASSWORD' \
              ' environment variable.'
      end
    end
  end

  def title_tag_breadcrumbs
    @title_tag_breadcrumbs ||= %w(GL•B)
  end
end
