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
      resources :likes, only: [:create, :destroy] do
        post :create_without_auth
      end
      resource :smses, only: [] do
        post :send_phone_confirmation_code
      end
      resources :phones, only: [:create] do
        collection do
          post :registration
          post :like
        end
      end
    end
  end
end