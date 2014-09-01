class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :pic, :first_name, :second_name, :vk_link, :twitter_link, :instagram_link, :birth_date, :about, :city_id

  belongs_to :city
  has_many :images
  has_many :phones
  has_many :likes, through: :images
  has_many :smses, through: :phones

  mount_uploader :pic, UsersUploader
  process_in_background :pic
  store_in_background :pic

  validates :city, presence: true

end
