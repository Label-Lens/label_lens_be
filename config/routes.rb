Rails.application.routes.draw do

  # match "login_emails/authenticate", to: "login_emails#authenticate", via: [:get, :post]
  # resource :login_email, only: [:new, :create]

  get '/auth/spotify/callback', to: 'users#spotify'


  get '/api/v1/search_album', to: 'api/v1/spotify#album_search'
  
  resources :sessions, only: [:new]

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index]
      get "find_user", to: "users#show"


    end
  end
end
