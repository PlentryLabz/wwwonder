class City < ActiveRecord::Base
  attr_accessible :name_ru, :name_en, :time_zone, :latitude, :longitute

  has_many :users

  validates :name_ru, presence: true
end
