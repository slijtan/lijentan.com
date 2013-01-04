class Sprite < ActiveRecord::Base
  attr_accessible :style, :url

  validates_inclusion_of :style, in: ["image"] #tiling, frame-by-frame-animation
end
