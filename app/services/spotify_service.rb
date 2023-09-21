class SpotifyService 

  def self.conn(endpoint_url)
    Faraday.new(url: "https://api.spotify.com/v1/#{endpoint_url}") 
  end

  def self.new_releases
    response = conn('browse/new-releases').get do |faraday| 
      faraday.headers['Authorization'] = Rails.application.credentials.spotify[:access_token]
    end
  end

  def self.return_albums_by_label(label)
    response = conn('search').get do |faraday| 
      faraday.headers['Authorization'] = "Bearer #{RSpotify.client_token}"
      faraday.params['q'] = "label:#{label}"
      faraday.params['type'] = "album"
    end
    JSON.parse(response.body, symbolize_names: true)
  end

end