Configus.build Rails.env do
  env :production do
  end

  env :development, parent: :production

  env :test, parent: :production
end