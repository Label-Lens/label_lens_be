require 'rails_helper'

RSpec.describe 'SpotifyService' do 
  describe '.class methods' do 
    describe '.conn' do 
      xit "returns a Faraday object" do 
        response = SpotifyService.new_releases

      end
    end
  end
end