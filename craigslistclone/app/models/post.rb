class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  validates_presence_of :user_id
end
