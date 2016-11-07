source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.0.0.1'
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
gem 'jquery-rails', '~> 4.2.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

#
# Engines and Middlewares
#

# RailsAdmin is a Rails engine that provides an easy-to-use interface for managing your data
gem 'rails_admin', '~> 1.0.0'

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

# ActiveModel elsewhere
gem 'active_attr', '~> 0.9.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

group :development, :test do
  # Annotate Rails classes with schema and routes info
  gem 'annotate'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # `rails c` alternative and runtime developer console
  gem 'pry-rails'
  # Code coverage
  gem 'simplecov', require: false
  # Shows objects in nicely formatted columns for easy reading.
  gem 'table_print'
end

group :test do
  # Test::Unit context framework extracted from Shoulda
  gem 'shoulda-context', '~> 1.2.1'
  # One-liners that test common Rails functionality
  gem 'shoulda-matchers', '~> 3.1.1'
  # Focus on one test at a time.
  gem 'minitest-focus'
  # Create customizable MiniTest output formats
  gem 'minitest-reporters'
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
