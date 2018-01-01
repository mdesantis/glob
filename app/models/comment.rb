class Comment < ApplicationRecord
  belongs_to :page, counter_cache: true

  validates_presence_of :page, :author, :content
end
