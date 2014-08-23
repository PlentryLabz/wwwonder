class Like < ActiveRecord::Base
  attr_accessible :user_id, :image_id

  belongs_to :user
  belongs_to :image, counter_cache: true
end
