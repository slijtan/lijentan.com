class Quote < ActiveRecord::Base
  self.inheritance_column = nil
  attr_accessible :quote, :source, :text_color, :text_size, :type, :post_id

  validates_presence_of :quote
  validates_inclusion_of :type, in: ["quote-right-float-down", "quote-right-float-up", "quote-center-float-down", "quote-center-float-up", "quote-left-float-down", "quote-left-float-down", "quote-big"]

  belongs_to :post
end
