class SpotifyService 

  def self.conn
    Faraday.new(url: 'https://api.spotify.com/v1/') do |faraday| 
      faraday.headers['Authorization'] = Rails.application.credentials.spotify[:access_token]
      faraday.adapter Faraday.default_adapter
    end
  end

  def self.new_releases
    response = conn.get('browse/new-releases')
  end

end