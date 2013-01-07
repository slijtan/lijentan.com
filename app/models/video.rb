class Video < ActiveRecord::Base
  attr_accessible :video_id, :host, :style
  validates_inclusion_of :style, :in => %{full-width}
  validates_inclusion_of :host, :in => %{youtube}
end
