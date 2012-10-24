class Image < ActiveRecord::Base
  attr_accessible :url, :post_id, :position

  belongs_to :post

  def thumbnail_url
    #appends -th right before the extension
    url_components = url.split(".")
    url_components[-2] += "-th"
    url_components.join(".")
  end
end
