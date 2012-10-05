class Post < ActiveRecord::Base
  self.inheritance_column = nil

  attr_accessible :background_url, :body, :date_published, :published, :title, :type
  validates :title, presence: true
  validates_inclusion_of :type, :in => [:text, :series, :photos, :album, :quote, :video]

  has_many :images, dependent: :destroy
end
