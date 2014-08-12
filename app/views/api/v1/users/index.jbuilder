json.array! @users do |user|
  json.(user, :id, :first_name, :second_name, :email)
  json.pic user.pic.url
end