class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  belongs_to :city
  validates_presence_of :user_id
end
