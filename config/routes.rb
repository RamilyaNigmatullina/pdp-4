Rails.application.routes.draw do
  root to: "pages#index"

  devise_for :users

  resources :chats, only: %i[create show] do
    resources :messages, only: %i[create]
  end
  resources :users, only: :index
  resource :profile, only: %i[edit update]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
    end
  end
end
