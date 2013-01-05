class AlbumElement < ActiveRecord::Base
  attr_accessible :album_id, :sequence, :album, :element

  belongs_to :album
  belongs_to :element, polymorphic: true
end
