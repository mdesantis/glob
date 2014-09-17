class Page < ActiveRecord::Base
  validates_presence_of :title

  before_save :update_slug

  def to_param
    return nil unless persisted?

    slug
  end

  private

  def update_slug
    self.slug = title.parameterize

    true
  end
end