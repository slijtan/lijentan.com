class Post < ActiveRecord::Base
  self.inheritance_column = nil

  @@valid_effects = %w[fade-in]

  attr_accessible :space, :published, :date_published, :bg_color, :title, :show_header, :height, :effect, :padding, :site

  validates_presence_of :title, :site
  validates_inclusion_of :space, in: %w[foreground background midground auto]
  validates_inclusion_of :padding, in: %w[medium], allow_nil: true
  validates_inclusion_of :effect, in: @@valid_effects, allow_nil: true
  #validate post height format *px, *% (unsupported), full (unsupported)

  has_many :post_elements, dependent: :destroy, order: 'sequence ASC'
  belongs_to :site
end
