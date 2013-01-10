class Site < ActiveRecord::Base
  attr_accessible :name, :show_nav, :header_post

  validates_presence_of :name

  has_many :posts
  belongs_to :header_post, class_name: "Post"
  has_many :domains
end
