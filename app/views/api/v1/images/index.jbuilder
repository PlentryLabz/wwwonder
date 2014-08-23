json.array! @images do |image|
  json.(image, :description, :likes_count)
  json.pic image.pic.url
  json.likes image.likes do |like|
    json.(like, :id, :user_id)
  end
end