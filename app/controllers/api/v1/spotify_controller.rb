class Api::V1::SpotifyController < ApplicationController

 
  def album_search
    
    album_search =  params["album"]
    #leverage RSpotify to return album search
    search = RSpotify::Album.search(album_search)
    #modified_album = album.gsub(' ', '+')

    searched_album = Album.new(search[0])
    
    #Albums with the same 
    albums = RSpotify::Album.search(searched_album.label)

    if albums.empty?
      temp_label = label
      while temp_label.present?
        temp_label = temp_label.chop
        albums = RSpotify::Album.search(temp_label)
        
        if albums.empty? == false
          break
        end

        if temp_label.empty?
          render json: {"error" => "No albums found"}
        end
      end
    end

    selected_albums = albums.map do |album|
      Album.new(album)
    end

    filtered_albums = selected_albums.find_all do |album|
      album if album.label.include?(searched_album.label)
    end

    all_albums = filtered_albums.unshift(searched_album)

    render json: AlbumsSerializer.new(all_albums)
    
    #Find all album information with the matching record labelq
    # albums.each do |album| 
    #   RSpotify::Album.find(album)
    # end
  end

end