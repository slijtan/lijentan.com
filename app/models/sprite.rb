class Sprite < ActiveRecord::Base
  attr_accessible :style, :url

  validates_inclusion_of :style, in: %w[image tiling cover]
end
