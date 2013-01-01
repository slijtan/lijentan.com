class PostElement < ActiveRecord::Base
  attr_accessible :alignment, :animation_direction, :animation_type, :element_id, :element_type, :element, :position, :post_id, :sequence

  belongs_to :element, polymorphic: true
  belongs_to :post

  #position validation, examples are top: 2px; left; center; right; top; bottom; inline;
end
