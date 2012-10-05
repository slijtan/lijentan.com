class Post < ActiveRecord::Base
  self.inheritance_column = nil

  attr_accessible :background_url, :foreground_url, :shifting_background, :body, :date_published, :published, :title, :type
  validates :title, presence: true
  validates_inclusion_of :type, :in => ['one-column-text', 'two-column-text', 'series', 'photos', 'album', 'quote', 'video', 'notes']

  has_many :images, dependent: :destroy
end
