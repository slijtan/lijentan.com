class Quote < ActiveRecord::Base
  self.inheritance_column = nil
  attr_accessible :quote, :source, :text_color, :text_size, :type, :post_id

  belongs_to :post
end
