Rails.application.routes.draw do
  match "login_emails/authenticate", to: "login_emails#authenticate", via: [:get, :post]

  get '/auth/spotify/callback', to: 'users#spotify'

  resource :login_email, only: [:new, :create]

  resources :sessions, only: [:new]
end
