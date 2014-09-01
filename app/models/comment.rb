class Comment < ActiveRecord::Base
  attr_accessible :body

  has_ancestry

  belongs_to :image
  belongs_to :user

  validates :body, presence: true
end
