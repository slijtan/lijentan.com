class Post < ActiveRecord::Base
  self.inheritance_column = nil

  @@valid_effects = %w[fade-in]

  attr_accessible :space, :published, :date_published, :bg_color, :title, :show_header, :height, :effect, :previous_post_id, :padding

  validates_presence_of :title
  validates_inclusion_of :space, in: %w[foreground background midground auto]
  validates_inclusion_of :padding, in: %w[medium], allow_nil: true
  validates_inclusion_of :effect, in: @@valid_effects, allow_nil: true
  #validate post height format *px, *% (unsupported), full (unsupported)

  has_many :images, dependent: :destroy, order: 'position ASC'
  has_many :videos, dependent: :destroy, order: 'position ASC'
  has_many :background_images, dependent: :destroy, order: 'z_index DESC'
  has_many :quotes, dependent: :destroy
  has_many :post_elements, dependent: :destroy, order: 'sequence ASC'
  belongs_to :previous_post, class_name: "Post"

end
