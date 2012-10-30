class Post < ActiveRecord::Base
  self.inheritance_column = nil

  @@valid_types = ['single-column-text', 'two-column-text', 'series', 'album', 'video', 'notes', 'quote']
  @@valid_styles = [
		    'album-thumbails', 'album-carousel', 'album-flipbook', #album styles
		    'quote-big', #quote styles
		    'video-big',
		   ]

  attr_accessible :type, :space, :style, :published, :date_published, :bg_color, :title, :body, :quote, :quote_source, :show_header, :text_color, :min_height
  cattr_reader :valid_types

  validates_presence_of :title
  validates_inclusion_of :type, in: @@valid_types
  validates_inclusion_of :space, in: ['foreground', 'background', 'midground', 'auto']

  has_many :images, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :background_images, dependent: :destroy, order: 'z_index DESC'

  def has_shifting_background?
    for background_image in background_images
      return true if background_image.is_shifting?
    end

    false
  end

  def has_background?
    !background_images.empty?
  end

end
