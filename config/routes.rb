Rails.application.routes.draw do
  constraints SubdomainConstraint.new do
    root to: "pages#index", as: :company_root

    devise_for :users, controllers: { invitations: "users/invitations" }

    resources :chats, only: %i[index create]
    resources :users, only: %i[index destroy] do
      resource :recovers, only: %i[create], module: :users
    end
    resource :profiles, only: [] do
      resource :passwords, only: %i[edit update], module: :profiles
    end
    resource :profile, only: %i[edit]
    resource :company, only: %i[edit]
  end

  constraints subdomain: "www" do
    scope module: :public do
      root to: "pages#index", as: :public_root

      resources :pages, only: %i[index]
      resources :companies, only: %i[new create]

      namespace :users, only: [] do
        resource :sign_in, only: %i[show create]
      end
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resource :company, only: %i[update]
      resource :profile, only: %i[update]
      resources :chats, only: %i[create] do
        resources :messages, only: %i[index create], module: :chats
        resource :reads, only: %i[create], module: :chats
      end
      resources :users, only: %i[index]
    end
  end
end
