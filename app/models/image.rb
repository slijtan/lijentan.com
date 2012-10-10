class Image < ActiveRecord::Base
  attr_accessible :url, :post_id, :position

  belongs_to :post
end
