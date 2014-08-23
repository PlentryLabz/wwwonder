Wwwonder::Application.routes.draw do

  devise_for :users

  resource :welcome, only: [:show]
  root to: 'welcome#show'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :users, only: [:index, :show]
      resources :cities, only: [:index]
      resources :images, only: [:index, :create, :destroy]
      resources :likes, only: [:create, :destroy]
    end
  end
end
