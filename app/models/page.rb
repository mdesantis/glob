class Page < ActiveRecord::Base
  validates_presence_of :slug
  
  def to_param
    return nil unless persisted?

    slug
  end
end