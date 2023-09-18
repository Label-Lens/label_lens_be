class Api::V1::SpotifyController < ApplicationController

 
  def album_search
    
    album =  params["query"]

    modified_album = album.gsub(' ', '%B')

   
  end

end