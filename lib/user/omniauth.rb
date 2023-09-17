module OmniAuth
  require 'rspotify/oauth'

  def omniauth
    if current_user
      # A user session already exists, so no need to start OmniAuth.
      redirect_to root_path, notice: "You are already logged in."
    else
      Rails.application.config.middleware.use OmniAuth::Builder do
        provider :spotify, Rails.application.credentials.spotify[:client_id], Rails.application.credentials.spotify[:client_secret], scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
      end
      OmniAuth.config.allowed_request_methods = [:post, :get]
    end
  end
end