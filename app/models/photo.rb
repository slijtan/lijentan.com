class Photo < ActiveRecord::Base
  attr_accessible :url
  has_one :album_element, as: :element
  has_one :album, through: :album_element

  def thumbnail_url
    #appends -th right before the extension
    url_components = url.split(".")
    url_components[-2] += "-th"
    url_components.join(".")
  end
end
