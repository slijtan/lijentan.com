class Video < ActiveRecord::Base
  attr_accessible :video_id, :host, :style
  validates_inclusion_of :style, :in => %{full-width medium}
  validates_inclusion_of :host, :in => %{youtube html5}
end
