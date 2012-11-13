class Quote < ActiveRecord::Base
  self.inheritance_column = nil
  attr_accessible :quote, :source, :text_color, :text_size, :type, :post_id

  validates_presence_of :quote
  validates_inclusion_of :type,
  in: ["quote-right-float-down", "quote-right-float-up", "quote-center-float-down", "quote-center-float-up", "quote-left-float-down", "quote-left-float-up", "quote-big",
       "quote-top-float-right", "quote-top-float-left", "quote-center-float-right", "quote-center-float-left", "quote-bottom-float-right", "quote-bottom-float-left",
       "quote-left-bottom", "quote-left-top", "quote-right-bottom", "quote-right-top"]

  belongs_to :post
end
