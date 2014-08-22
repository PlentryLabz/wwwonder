json.(@user,
  :id,
  :email,
  :first_name,
  :second_name,
  :phone_number,
  :vk_link,
  :twitter_link,
  :instagram_link,
  :birth_date,
  :about,
  :created_at,
  :updated_at)

json.pic @user.pic.url

json.city(@user.city, :id, :name_ru, :name_en, :time_zone, :latitude, :longitute)

json.images @user.images do |img|
  json.(img, :id, :pic, :description)
end
