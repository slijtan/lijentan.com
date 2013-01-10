class Domain < ActiveRecord::Base
  attr_accessible :domain, :site_id, :site

  belongs_to :site
end
