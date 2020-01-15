Rails.application.routes.draw do
  constraints SubdomainConstraint.new do
    root to: "pages#index", as: :company_root

    devise_for :users

    resources :chats, only: %i[create show]
    resources :users, only: :index
    resource :profile, only: %i[edit]
    resource :company, only: %i[edit]
  end

  scope module: :public do
    root to: "pages#index", as: :public_root

    resources :companies, only: %i[new create show]

    namespace :users, only: [] do
      resource :sign_in, only: %i[show create]
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resource :company, only: %i[update]
      resource :profile, only: %i[update]
      resources :chats, only: [] do
        resources :messages, only: %i[index create]
      end
    end
  end
end
