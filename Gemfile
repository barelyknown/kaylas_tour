source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem "jquery-turbolinks"
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :test do
  gem 'rspec-rails'
  gem 'guard-rspec', '~> 4.0.3', require: false
  gem 'ruby_gntp'
  gem 'shoulda-matchers'
end

group :development, :test do
  gem 'database_cleaner'
  gem "debugger"
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
gem 'unicorn'
gem 'youtube_it'
gem 'figaro'

# Use Capistrano for deployment
group :development do
  gem 'capistrano', '~> 2.15'
end

group :production do
  gem 'mysql2' # If using mysql in development, this can be outside the production group.
  gem 'therubyracer'
end

# Use debugger
# gem 'debugger', group: [:development, :test]
gem "rails_12factor"
gem 'haml-rails', '~> 0.4'
gem 'anjlab-bootstrap-rails', '>= 3.0.0.3', :require => 'bootstrap-rails', github: "barelyknown/bootstrap-rails", branch: "generate-md5-fingerprint-for-font-files"
gem 'simple_form', github: 'barelyknown/simple_form', branch: 'ignore-default-input-class'
gem 'will_paginate'
gem 'will_paginate-bootstrap', github: 'barelyknown/will_paginate-bootstrap'
gem 'pg_search'
gem 'acts_as_list'