source 'https://rubygems.org'

ruby '1.9.3'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'jquery-rails'
gem 'pg'
gem "factory_girl_rails", "~> 4.0"
gem 'forgery', '0.5.0'
gem "rspec-rails", ">= 2.10.1", :group => [:development, :test]
gem "redcarpet"
gem 'nokogiri'
gem 'coderay'
gem 'seedbank'

group :test do
  gem 'cucumber-rails', :require => false
  gem 'capybara'

  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
end

group :development, :test do
  gem 'sqlite3'
  gem 'awesome_print'
  gem 'quiet_assets'
end

group :production do
  gem 'thin'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'