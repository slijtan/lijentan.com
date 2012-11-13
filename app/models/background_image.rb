class BackgroundImage < ActiveRecord::Base
  self.inheritance_column = nil

  attr_accessible :tile, :type, :url, :z_index, :post_id

  validates_presence_of :url, :z_index, :post_id
  validates_inclusion_of :type, in: ["shift_down", "shift_up", "shift_left", "shift_right", "fixed", "scrolling"]

  belongs_to :post

  def is_shifting?
    ["shift_down", "shift_up", "shift_left", "shift_right"].include?(type)
  end
end
