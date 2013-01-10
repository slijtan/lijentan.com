class TextBox < ActiveRecord::Base
  attr_accessible :bg_color, :style, :text, :text_color, :text_size, :text_align

  has_one :post_element, as: :element

  validates_inclusion_of :style, in: %w[full-margins full-no-margins single-column-text two-column-text single-line-text quote-big]
end
