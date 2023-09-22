require 'rails_helper'

RSpec.describe 'SpotifyService' do 
  describe '.class methods' do 
    describe '.return_albums_by_label' do 
      it "returns album id to search an album's label" do 
        response = SpotifyService.return_albums_by_label("Rounder Records")
        
        expect(response).to be_a Hash
        expect(response[:albums][:items]).to be_an Array
        expect(response[:albums][:items][0]).to have_key(:id)
        expect(response[:albums][:items][0]).to have_key(:album_type)
        expect(response[:albums][:items][0]).to have_key(:artists)
        expect(response[:albums][:items][0]).to have_key(:available_markets)
      end
    end
  end
end