require 'sidekiq/web'
Wwwonder::Application.routes.draw do

  resource :base, only: [:show]
  root to: 'base#show'

  devise_for :users

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :users, only: [:index, :show]
      resource :profile, only: [:show, :update]

      resources :cities, only: [:index]
      resources :images, only: [:index, :create, :destroy]
      resources :likes, only: [:create, :destroy]
      resources :phones, only: [:create]
      resources :comments, only: [:index, :create, :destroy]
      resource :code_confirmations, only: [:create]

      resource :upload, only: [:create]
    end
  end

  namespace :web do
    resource :users
  end

  mount Sidekiq::Web, at: "/sidekiq"
end


