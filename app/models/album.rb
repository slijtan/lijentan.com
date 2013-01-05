class Album < ActiveRecord::Base
  attr_accessible :style

  validates_inclusion_of :style, in: %w[thumbnail-rows]
  has_many :album_elements, dependent: :destroy, order: 'sequence ASC'

end
