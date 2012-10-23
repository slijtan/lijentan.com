class Post < ActiveRecord::Base
  self.inheritance_column = nil

  @@valid_types = ['single-column-text', 'two-column-text', 'series', 'album', 'video', 'notes', 'quote']
  @@valid_styles = [
		    'album-thumbails', 'album-carousel', 'album-flipbook', #album styles
		    'quote-big', #quote styles
		    'video-big',
		   ]

  attr_accessible :type, :space, :style, :published, :date_published, :bg_color, :bg_img_fixed, :bg_img_shift_down_1, :bg_img_shift_down_2, :title, :body, :quote, :quote_source, :show_header, :text_color
  cattr_reader :valid_types

  validates_presence_of :title
  validates_inclusion_of :type, :in => @@valid_types
  validates_inclusion_of :space, :in => ['foreground', 'background', 'midground', 'auto']

  has_many :images, dependent: :destroy
  has_many :videos, dependent: :destroy

  def has_shifting_background?
    !bg_img_shift_down_1.blank? || !bg_img_shift_down_2.blank?
  end

  def has_background?
    !bg_img_fixed.blank? || has_shifting_background?
  end
end
