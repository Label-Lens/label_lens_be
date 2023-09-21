class SessionsController < ApplicationController

  def new 

  end

  def create 
    client_id = Rails.application.credentials.spotify[:client_id]
    client_secret = Rails.application.credentials.spotify[:client_secret]
    frontend_url = Rails.application.credentials.urls[:frontend]
    backend_url = Rails.application.credentials.urls[:backend]

    code = params[:code]

    conn = Faraday.new(url: 'https://accounts.spotify.com', headers: {'Accept': 'application/json'})

    response = conn.post('/api/token') do |req|
    req.params['grant_type'] = "authorization_code"
    req.params['code'] = code
    req.params['client_id'] = client_id
    req.params['client_secret'] = client_secret
    req.params['redirect_uri'] = "https://label-lens-back-end.onrender.com/auth/spotify/callback"
    end

    data = JSON.parse(response.body, symbolize_names: true)
    access_token = data[:access_token]

    conn = Faraday.new(
      url: 'https://api.spotify.com/v1/',
      headers: {
        'Authorization': "Bearer #{access_token}"
      }
    )
    
    response = conn.get('me')
    data = JSON.parse(response.body, symbolize_names: true)

    user = User.find_or_create_by(uid: data[:id])
    user.token = access_token
    session[:user_id] = user.id
    redirect_to "https://label-lens.onrender.com/spotify_search", allow_other_host: true
  end
# 'Authorization': "Basic #{base64_credentials}",
        # 'Content-Type': "application/x-www-form-urlencoded"
  def destroy
    session[:spotify_user_id] = nil
    session[:spotify_token] = nil
    redirect_to "https://label-lens.onrender.com/", notice: 'Logged out from Spotify'
  end
end