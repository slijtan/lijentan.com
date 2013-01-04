class BackgroundImage < ActiveRecord::Base
  self.inheritance_column = nil

  attr_accessible :tile, :image_id, :z_index

  validates_presence_of :z_index, :image_id
  #validates_inclusion_of :type, in: ["shift_down", "shift_up", "shift_left", "shift_right", "fixed", "scrolling"]

=begin
  def is_shifting?
    ["shift_down", "shift_up", "shift_left", "shift_right"].include?(type)
  end
=end
end
