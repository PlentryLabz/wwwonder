require 'sidekiq/web'
Wwwonder::Application.routes.draw do

  devise_for :users

  resource :welcome, only: [:show]
  root to: 'welcome#show'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :users, only: [:index, :show, :update]
      resource :profile, only: [:show, :update]

      resources :cities, only: [:index]
      resources :images, only: [:index, :create, :destroy]
      resources :likes, only: [:create, :destroy]
      resources :phones, only: [:create]
      resource :code_confirmations, only: [:create]

      resource :upload, only: [:create]
    end
  end

  resources :snippets
  root to: "snippets#new"
  mount Sidekiq::Web, at: "/sidekiq"
end


