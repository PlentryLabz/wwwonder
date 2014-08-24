json.array! @images do |image|
  json.(image, :description, :likes_count)
  json.pic image.pic.url
  json.likes image.likes do |like|
    json.(like, :id)
    json.user do
      json.(like.user, :id, :first_name, :second_name)
      json.pic like.user.pic.url
    end
  end
end