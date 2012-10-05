class Image < ActiveRecord::Base
  attr_accessible :url, :post_id, :sequence

  belongs_to :post
end
