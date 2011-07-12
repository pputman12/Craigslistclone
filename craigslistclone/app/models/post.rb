class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  belongs_to :city
  #validates_presence_of :user_id
  validates_presence_of :title
  validates_presence_of :content
  mount_uploader :picture, PictureUploader
  
end
