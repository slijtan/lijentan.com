class Video < ActiveRecord::Base
  attr_accessible :video_id, :position, :post_id, :host
  validates_inclusion_of :host, :in => %{youtube, vimeo}

  belongs_to :post
end
