json.array! @images do |image|
  json.(image, :pic, :description, :likes_count)
  json.likes image.likes do |like|
    json.(like, :id, :user_id)
  end
end