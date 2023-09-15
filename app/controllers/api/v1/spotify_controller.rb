class Api::V1::SpotifyController < ApplicationController
  def search
    conn = Faraday.new(url: "https://api.spotify.com/v1/search")

    response = conn.get("/search?q=pet+sounds&type=album")

    data = JSON.parse(response.body, symbolize_names: true)
    require 'pry'; binding.pry
  end
end