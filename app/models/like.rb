class Like < ActiveRecord::Base
  attr_accessible :phone_id, :image_id

  belongs_to :phone
  belongs_to :image, counter_cache: true

  validates :image, presence: true
  validates :phone, presence: true
  validate :deny_by_myself
  validates :phone_id, uniqueness: {scope: :image_id}

  def deny_by_myself
    errors.add(:phone_id, 'User cant make like to him photos') if phone.user == image.user
  end
end