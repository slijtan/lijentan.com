class Post < ActiveRecord::Base
  self.inheritance_column = nil

  @@valid_types = ['one-column-text', 'two-column-text', 'series', 'photos', 'album', 'video', 'notes']
  attr_accessible :background_color, :background_url, :foreground_url, :background_quote, :background_quote_author, :shifting_background, :space, :body, :date_published, :published, :title, :type
  cattr_reader :valid_types

  validates :title, presence: true
  validates_inclusion_of :type, :in => @@valid_types
  validates_inclusion_of :space, :in => ['foreground', 'background', 'midground', 'auto']

  has_many :images, dependent: :destroy
end
