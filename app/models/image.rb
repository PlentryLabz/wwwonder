class Image < ActiveRecord::Base
  attr_accessible :user_id, :pic, :description

  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :user, presence: true

  mount_uploader :pic, ImagesUploader
end
