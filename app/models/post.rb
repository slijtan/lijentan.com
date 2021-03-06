class Post < ActiveRecord::Base
  self.inheritance_column = nil

  @@valid_effects = %w[fade-in]

  attr_accessible :space, :published, :date_published, :bg_color, :title, :show_header, :height, :effect, :padding, :site, :display_order, :depth

  validates_presence_of :title, :site
  validates_inclusion_of :space, in: %w[foreground background midground auto mid-to-foreground back-to-midground], allow_nil: true
  validates_inclusion_of :padding, in: %w[medium], allow_nil: true
  validates_inclusion_of :effect, in: @@valid_effects, allow_nil: true
  #validate post height format *px, *% (unsupported), full (unsupported)

  has_many :post_elements, dependent: :destroy, order: 'sequence ASC'
  belongs_to :site

  def is_header_post?
    self.id == site.header_post_id
  end
end
