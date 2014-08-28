json.(@user,
  :id,
  :email,
  :first_name,
  :second_name,
  :vk_link,
  :twitter_link,
  :instagram_link,
  :birth_date,
  :about,
  :created_at,
  :updated_at)

json.pic @user.pic.url