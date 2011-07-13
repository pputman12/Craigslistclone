class Story < ActiveRecord::Base
  belongs_to :city
  mount_uploader :picture, PictureUploader
  
end
