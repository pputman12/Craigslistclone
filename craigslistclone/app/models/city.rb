class City < ActiveRecord::Base
  has_many :categories
  has_many :posts
  has_many :stories
end
