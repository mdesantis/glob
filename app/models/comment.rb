class Comment < ActiveRecord::Base
  belongs_to :page, counter_cache: true
end