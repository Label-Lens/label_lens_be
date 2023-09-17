Rails.application.routes.draw do

  # match "login_emails/authenticate", to: "login_emails#authenticate", via: [:get, :post]
  # resource :login_email, only: [:new, :create]
  get '/auth/spotify/callback', to: 'sessions#create'
  post "/auth/spotify", to: "sessions#new"
  get '/logout', to: 'sessions#destroy'

  resources :sessions, only: [:new]

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create]
      get "find_user", to: "users#show"
    end
  end
end
