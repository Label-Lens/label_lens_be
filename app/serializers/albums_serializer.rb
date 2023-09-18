class AlbumsSerializer
  include JSONAPI::Serializer
  set_id :id 
  set_type :album
  
  attributes :id, :album_name, :artist, :image, :label, :link
end