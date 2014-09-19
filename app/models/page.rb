class Page < ActiveRecord::Base
  module Markups
    PARAGRAPHS = 'Paragraphs'.freeze
    HTML       = 'HTML'.freeze
  end

  MARKUPS = [Markups::PARAGRAPHS, Markups::HTML]

  validates_presence_of  :title
  validates_inclusion_of :markup, in: MARKUPS

  before_save   :convert_content_to_valid_html
  after_create  :create_slug
  before_update :update_slug

  def to_param
    return nil unless persisted?

    slug
  end

  private

  def generate_slug
    "#{id} #{title}".parameterize
  end

  def create_slug
    update_column :slug, generate_slug
  end

  def update_slug
    self.slug = generate_slug

    true
  end

  def convert_content_to_valid_html
    if content && markup == Markups::PARAGRAPHS
      self.content = Nokogiri::HTML::DocumentFragment.parse(content).to_html
    end

    true
  end
end