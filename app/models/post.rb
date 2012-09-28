class Post < ActiveRecord::Base
  attr_accessible :background_url, :body, :date_published, :published, :title
end
