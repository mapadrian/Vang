class Picture < ApplicationRecord
  belongs_to :user
  mount_uploader :user_picture, UserPictureUploader
  has_many :comments, dependent: :destroy
end
