Rails.application.routes.draw do 

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create]
      get "find_user", to: "users#show"
    end
  end
  
  resources :sessions, only: [:new]

  get '/api/v1/search_album', to: 'api/v1/spotify#album_search'

  get '/auth/spotify/callback', to: 'sessions#create'
  post "/auth/spotify", to: "sessions#new"

  get '/logout', to: 'sessions#destroy'
end
