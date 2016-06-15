class Topic < ActiveRecord::Base
  has_many :articles
  default_scope { order('created_at DESC') }
end
