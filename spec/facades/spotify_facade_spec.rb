require "rails_helper"

RSpec.describe SpotifyFacade do 
  describe "class methods" do
    describe ".search_by_label", :vcr do 
      it "returns an id for searching album's label" do 
        id = SpotifyFacade.search_by_label("Rounder Records")
        expect(id).to be_an Array
        expect(id).to eq(["4QCpyPj8LCnc5C8Lpz7ueE"])
      end
    end
  end
end