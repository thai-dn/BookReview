source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.1'
gem 'rails', '~> 5.2.2', '>= 5.2.2.1'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'simple_form', '~> 4.1'
gem 'bootstrap', '~> 4.1.1'
gem 'jquery-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'simple_form', '~> 4.1'
gem 'devise', '~> 4.6', '>= 4.6.2'
gem "paperclip", "~> 6.0.0"
gem 'ransack', github: 'activerecord-hackery/ransack'
gem "cocoon"
gem 'pg'
gem 'carrierwave'
gem 'cloudinary'
gem 'omniauth-facebook'
gem 'omniauth-heroku'
gem 'koala'
gem 'active_model_serializers', '~> 0.10.9'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem 'capistrano',           require: false
  gem 'capistrano-rvm',       require: false
  gem 'capistrano-rails',     require: false
  gem 'capistrano-bundler',   require: false
  gem 'capistrano3-puma',     github: "seuros/capistrano-puma"
  gem 'capistrano-passenger', git: 'https://github.com/capistrano/passenger.git', branch: 'master'
  gem 'awesome_print'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
