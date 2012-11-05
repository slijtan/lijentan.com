class Post < ActiveRecord::Base
  self.inheritance_column = nil

  @@valid_types = ['single-column-text', 'two-column-text', 'time-lapse', 'album', 'video', 'notes', 'quote']
  @@valid_styles = [
                    'album-thumbails', 'album-strip', 'album-carousel', 'album-flipbook', #album styles
                    'video-big',
                   ]
  @@valid_effects = ['fade-in']

  attr_accessible :type, :space, :style, :published, :date_published, :bg_color, :title, :body, :show_header, :min_height, :effect, :previous_post_id
  cattr_reader :valid_types

  validates_presence_of :title
  validates_inclusion_of :type, in: @@valid_types
  validates_inclusion_of :space, in: ['foreground', 'background', 'midground', 'auto']
  validates_inclusion_of :effect, in: @@valid_effects, allow_nil: true

  has_many :images, dependent: :destroy, order: 'position ASC'
  has_many :videos, dependent: :destroy, order: 'position ASC'
  has_many :background_images, dependent: :destroy, order: 'z_index DESC'
  has_many :quotes, dependent: :destroy
  belongs_to :previous_post, class_name: "Post"

  def method_missing(name, *args)
    name = name.to_s
    case name.to_s
    when /is_(.*)\?/
      type == ($1).gsub(/_/, "-")
    end
  end

  def has_shifting_background?
    for background_image in background_images
      return true if background_image.is_shifting?
    end

    false
  end

  def has_background?
    !background_images.empty?
  end

  def time_lapse_posts
    posts = []
    posts << self

    while post = posts[-1].previous_post
      posts << post
    end

    posts
  end

  def images_with_time_lapse
    images = []

    for post in time_lapse_posts
      images.concat(post.images_without_time_lapse)
    end

    images
  end

  alias_method_chain :images, :time_lapse
end
