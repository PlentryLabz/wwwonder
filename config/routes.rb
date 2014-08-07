Wwwonder::Application.routes.draw do

  devise_for :users

  resource :welcome, only: [:show]
  root to: 'welcome#show'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update]
    end
  end
end
