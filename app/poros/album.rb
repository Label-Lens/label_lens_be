class Album 
  attr_reader :id, :label, :album_name, :artist, :image, :link

  def initialize(data)
    @id = data.id
    @label = data.label
    @album_name = data.name
    @artist = data.artists.first.name
    @image = data.images.last
    @link = data.artists.first.external_urls["spotify"]
  end

  
end