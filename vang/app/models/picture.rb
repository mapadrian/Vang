class Picture < ApplicationRecord
  belongs_to :user
  mount_uploader :user_picture, UserPictureUploader
end
