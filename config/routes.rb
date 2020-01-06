Rails.application.routes.draw do
  devise_for :users

  constraints SubdomainConstraint.new do
    root to: "pages#index", as: :company_root

    resources :chats, only: %i[create show]
    resources :users, only: :index
    resource :profile, only: %i[edit update]
  end 

  scope module: :public do
    root to: "pages#index", as: :public_root

    resources :companies, only: %i[new create show]
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :chats, only: [] do
        resources :messages, only: %i[index create]
      end
    end
  end
end
