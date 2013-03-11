class Site < ActiveRecord::Base
  attr_accessible :name, :show_nav, :header_post, :ga
  attr_reader :col_width, :gutter_width

  validates_presence_of :name

  has_many :posts, dependent: :destroy
  has_many :domains, dependent: :destroy
  belongs_to :header_post, class_name: "Post", dependent: :destroy
  has_one :site_style, dependent: :destroy

  before_create :build_site_style

  #mirrors variables found in variables.css.scss
  COL_WIDTH = 60
  GUTTER_WIDTH = 20
end
