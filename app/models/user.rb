class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :pic, :first_name, :second_name, :phone_number, :phone_confirmation_code, :vk_link, :twitter_link, :instagram_link, :birth_date, :about

  mount_uploader :pic, UsersUploader
end
