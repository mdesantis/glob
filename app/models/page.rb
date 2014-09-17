class Page < ActiveRecord::Base
  validates_presence_of :title

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
end