class SpotifyService 

  def self.conn(endpoint_url)
    Faraday.new(url: "https://api.spotify.com/v1/#{endpoint_url}") 
  end

  def self.return_albums_by_label(label)
    response = conn('search').get do |faraday| 
      faraday.headers['Authorization'] = "Bearer #{RSpotify.client_token}"
      faraday.params['q'] = "label:#{label}"
      faraday.params['type'] = "album"
    end
    JSON.parse(response.body, symbolize_names: true)
    # require 'pry'; binding.pry
  end

end