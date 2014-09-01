class Comment < ActiveRecord::Base
  attr_accessible :body

  has_ancestry

  belongs_to :image
  belongs_to :user

  validates :body, presence: true
  validates :user, presence: true
  validates :image, presence: true
end
