json.array! @cities do |city|
  json.(city, :name_ru, :name_en)
end