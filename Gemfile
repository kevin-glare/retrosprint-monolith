# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'rails', '~> 7.0.4'

gem 'bootsnap', require: false
gem 'devise'
gem 'importmap-rails'
gem 'paranoia'
gem 'pg', '~> 1.4'
gem 'puma', '~> 5.0'
gem 'redis', '~> 5.0'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
end

group :development do
  gem 'brakeman', require: false
  gem 'bullet'
  gem 'bundler-audit'
  gem 'fasterer'
  gem 'marginalia'
  gem 'overcommit'
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end
