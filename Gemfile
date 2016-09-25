source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.7.1'
# Use MySQL as the database for Active Record
gem 'mysql2'
# Modern, Concurrent Web Server for Ruby
gem 'puma', '~> 3.6.0'

#
# Assets
#

# Parse CSS and add vendor prefixes to rules by Can I Use
gem 'autoprefixer-rails', '~> 6.4'
# Add CommonJS module support to Sprockets (via Browserify)
gem 'browserify-rails', '~> 3.2.0'
# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 4.2.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Intrate C implementation of Sass into the asset pipeline
gem 'sassc-rails', '~> 1.3.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

#
# Engines and Middlewares
#

# RailsAdmin is a Rails engine that provides an easy-to-use interface for managing your data
gem 'rails_admin', '~> 1.0.0'

#
# Backports
#

# Backport render anywhere feature from Rails 5
gem 'backport_new_renderer', '~> 1.0.0'
# Backport of ActiveRecord::SecureToken 5 to AR 3.x and 4.x
gem 'has_secure_token', '~> 1.0.0'
# Make rendering and caching a collection of template partials easy
gem 'multi_fetch_fragments', '~> 0.0.17'
# 12 Factor app configuration, drop on upgrade to Rails 5
gem 'rails_12factor', group: :production
# Where or function backport from Rails 5
gem 'where-or', '~> 0.1.2'

#
# Perf
#

# C implementation of Active Support's String#blank?
gem 'fast_blank', '~> 1.0.0', platform: :mri
# C extensions for escaping text
gem 'fast_xs', '~> 0.8.0', platform: :mri
# Generic swappable back-end for JSON
gem 'multi_json', '~> 1.12.1'
# Optimized JSON
gem 'oj', '~> 2.17.4', platform: :mri

#
# Misc
#

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# Simple Rails app configuration
gem 'figaro', '~> 1.1.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

group :development, :test do
  # Annotate Rails classes with schema and routes info
  gem 'annotate'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # `rails c` alternative and runtime developer console
  gem 'pry-rails'
  # Test with RSpec
  gem 'rspec-rails'
  # Code coverage
  gem 'simplecov', require: false
  # Shows objects in nicely formatted columns for easy reading.
  gem 'table_print'
end

group :test do
  # One-liners that test common Rails functionality
  gem 'shoulda-matchers'
end

group :development do
  # Better error page for Rack apps
  gem 'better_errors'
  # Retrieve the binding of a method's caller; enhances better_errors
  gem 'binding_of_caller'
  # Help to kill N+1 queries and unused eager loading
  gem 'bullet', '~> 5.4.0'
  # Preview mail in the browser instead of sending
  gem 'letter_opener'
  # Supporting gem for Rails Panel
  gem 'meta_request'
  # Speed up development by keeping your application running in the background
  gem 'spring', '~> 1'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end
