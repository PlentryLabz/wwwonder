class Like < ActiveRecord::Base
  attr_accessible :phone_id, :image_id

  belongs_to :phone
  belongs_to :user, through: :phone
  belongs_to :image, counter_cache: true
end
