require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :spotify, "e5b23eaa3a0a44cd9e4bc6383601b23e", "8b0fd39d33ab49ddb161850a9bf8ada7", scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
end
OmniAuth::AuthenticityTokenProtection.default_options(key: "csrf.token", authenticity_param: "_csrf")
OmniAuth.config.silence_get_warning = true
OmniAuth.config.allowed_request_methods = [:post, :get]