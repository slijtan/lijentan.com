class Sprite < ActiveRecord::Base
  attr_accessible :style, :url, :width, :height

  validates_inclusion_of :style, in: %w[image tiling cover full-height]
end
