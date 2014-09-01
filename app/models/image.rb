class Image < ActiveRecord::Base
  attr_accessible :user_id, :pic, :description

  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :user, presence: true

  mount_uploader :pic, ImagesUploader
  process_in_background :pic
  store_in_background :pic
end
