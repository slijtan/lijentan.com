class Video < ActiveRecord::Base
  attr_accessible :video_data, :host, :style
  validates_inclusion_of :style, :in => %{full-width medium}
  validates_inclusion_of :host, :in => %{youtube html5}

  serialize :video_data
end
