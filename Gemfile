source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.3'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'jquery-turbolinks'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'cancancan', '~> 2.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'haml-rails', '~> 0.9'
gem 'devise'
gem 'protokoll'
gem "paperclip", "~> 5.0.0"
gem 'rails-ujs'
gem 'less-rails', '~> 2.7.0'
gem 'therubyracer', platforms: :ruby
gem 'json'
gem 'sdoc', group: :doc
gem 'aws-sdk', '~> 2.3.0'
gem 'will_paginate', '~> 3.1.1'
gem 'filterrific'
gem 'friendly_id', '~> 5.1.0'
gem 'rubyzip', '~> 1.1.0'
gem 'axlsx', '2.1.0.pre'
gem 'axlsx_rails'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'figaro'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'coveralls', require: false
  gem 'launchy'
  gem 'foreman'
  gem 'faker', :git => 'git://github.com/stympy/faker.git', :branch => 'master'

end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
