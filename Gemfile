source 'https://rubygems.org'
ruby '2.5.0'

gem 'autoprefixer-rails',      '9.4.7'
# Use ActiveModel has_secure_password
gem 'bcrypt',                  '3.1.12'
# Cuts boot times in half
gem 'bootsnap', require: false
gem 'bootstrap',               '4.2.1'
gem 'carrierwave',             '1.3.1'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails',            '4.2.2'
# Translate enums to SimpleForm select field
gem 'enum_help',               '0.0.17'
gem 'faker',                   '1.9.1'
gem 'figaro',                  '1.1.1'
gem 'fog',                     '2.1.0'
gem 'font-awesome-rails'
gem 'friendly_id',             '5.2.5'
gem 'gmaps4rails',             '2.1.2'
gem 'gon',                     '6.2.1'
gem 'hover-rails',             '2.3.2.1'
# Build JSON APIs with ease
gem 'jbuilder',                '2.8.0'
# Use jquery as the JavaScript library
gem 'jquery-rails',            '4.3.3'
gem 'leaflet-rails',           '1.3.1'
gem 'meta-tags',               '2.11.1'
gem 'mini_magick',             '4.9.2'
gem 'photoswipe-rails',        '4.1.2'
gem 'puma',                    '3.12.0'
gem 'rails',                   '5.2.2'
gem 'sassc-rails',             '2.1.0'
# Easy forms
gem 'simple_form',             '4.1.0'
# Turbolinks makes following links in your web application faster.
# Read more: https://github.com/rails/turbolinks
# Disabled to stop javascript glitches
# gem 'turbolinks',              '5.0.1'
gem 'will_paginate',           '3.1.6'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier',                '4.1.20'
gem 'underscore-rails',        '1.8.3'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop
  # execution and get a debugger console
  gem 'byebug',                '10.0.2', platform: :mri
  # Ensures clean testing databases each time
  gem 'database_cleaner',      '1.7.0'
  # Fixtures replacement with a straightforward definition syntax
  gem 'factory_bot_rails',     '5.0.1'
  # Testing Framework
  gem 'rspec-rails',           '3.8.2'
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3',               '~> 1.3.6'
end

group :development do
  # Improved error screens
  gem 'better_errors',         '2.5.0'
  gem 'binding_of_caller',     '0.8.0'
  # Check for security vulnerabilities
  gem 'brakeman', require: false
  # Listen to file modifications and notifiy about the changes
  gem 'listen', '3.1.5'
  # Favicon generator
  gem 'rails_real_favicon',    '0.0.12'
  # Rubocop isn't compiling with Travis.
  # Check ruby style
  # gem 'rubocop', '~> 0.47.1', require: false
  # Spring speeds up development by keeping your
  # application running in the background.
  # Read more: https://github.com/rails/spring
  gem 'spring',                '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console',           '3.7.0'
end

group :test do
  # Tests by simulating how a real user would interact with the app.
  gem 'capybara',                  '3.13.2'
  gem 'guard',                     '2.15.0'
  gem 'guard-minitest',            '2.4.6'
  gem 'guard-rspec', require: false
  gem 'minitest-reporters',        '1.3.6'
  # Provides Travis CI with rack access.
  gem 'rack',                      '2.0.6'
  gem 'rails-controller-testing',  '1.0.4'
  # A browser automation framework and ecosystem.
  gem 'selenium-webdriver',        '3.141.0'
  # Provides RSpec-compatible one-liners that test common Rails functionality.
  gem 'shoulda-matchers',          '4.0.0.rc1'
  # Travis CI Ruby Test Coverage
  gem 'simplecov',                 '0.16.1'
end

group :production do
  gem 'pg',             '1.1.4'
  gem 'rails_12factor', '0.0.3'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
