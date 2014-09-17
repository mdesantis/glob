class Page < ActiveRecord::Base
  def to_param
    return nil unless persisted?

    slug
  end
end