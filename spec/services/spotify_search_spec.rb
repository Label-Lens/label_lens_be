require "rails_helper"

RSpec.describe "Album Search" do
  describe "happy path" do
    it "should return an album with information" do
      get "api/v1/search"
      
      stub_request(:get, 'https://api.spotify.com/v1/search?q=pet+sounds&type=album')
      .to_return(status: 200, body: File.read('spec/fixtures/spotify/spotify_search_album_api_response.json'))

      require 'pry'; binding.pry
    end
  end
end