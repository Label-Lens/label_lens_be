class Api::V1::SpotifyController < ApplicationController


  def album_search
    # users search
    artist_search = params["artist"]

    album_search =  params["album"]
    #leverage RSpotify to return album search with artist search included
    search_results = RSpotify::Album.search("#{album_search} artist:#{artist_search}")  
    # get first album from search and returns poro of it
    searched_album = Album.new(search_results[0])

    searched_album = Album.new(search[0])
    
    #Albums with the same 
    albums = RSpotify::Album.search(searched_album.label, offset: 8, limit: 4)

    # Finds all albums associated with ID
    albums = album_ids.map do |album_id|
      RSpotify::Album.find(album_id)
    end

    # Makes poros of albums
    selected_albums = albums.map do |album|
      Album.new(album)
    end

    # Adds searched album to beginning
    all_albums = selected_albums.unshift(searched_album)

    render json: AlbumsSerializer.new(all_albums)
  end
end