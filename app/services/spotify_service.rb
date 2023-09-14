class SpotifyService 

  def self.conn(endpoint_url)
    Faraday.new(url: "https://api.spotify.com/v1/#{endpoint_url}") 
  end

  def self.new_releases
    require 'pry'; binding.pry
    response = conn('browse/new-releases').get do |faraday| 
      faraday.headers['Authorization'] = Rails.application.credentials.spotify[:access_token]
      # faraday.adapter Faraday.default_adapter
    end
  end

end