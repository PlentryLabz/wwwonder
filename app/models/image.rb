class Image < ActiveRecord::Base
  attr_accessible :user_id, :pic, :description

  belongs_to :user

  validates :pic, presence: true
  validates :user, presence: true

  mount_uploader :pic, ImagesUploader
end
