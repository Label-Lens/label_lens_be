class SpotifyFacade
  def self.search_by_label(label)
    albums = SpotifyService.return_albums_by_label(label)[:albums][:items].map do |album_data|
      album_data[:id]
    end
  end
end