Rails.application.routes.draw do
  root to: "pages#index"

  devise_for :users

  resources :companies, only: %i[new create show]
  resources :chats, only: %i[create show]
  resources :users, only: :index
  resource :profile, only: %i[edit update]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :chats, only: [] do
        resources :messages, only: %i[create]
      end
    end
  end
end
