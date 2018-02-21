source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails_12factor', group: :production
gem 'devise'
gem 'rails', '5.1.4'
gem 'puma', '3.9.1'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

group :development, :test do
  gem 'sqlite3', '1.3.13'
  gem 'byebug', '~> 9.0.6', platform: :mri
end

group :development do
  gem 'web-console', '2.0'
  gem 'spring', '2.0.2'
  gem 'better_errors', '2.4.0'
end

group :test do
  gem 'faker', '1.8.7'
	gem 'capybara', '2.17.0'
  gem 'rspec-rails', '3.7.2'
  gem 'factory_bot_rails', '4.8.2'
	gem 'selenium-webdriver'
	gem 'database_cleaner'
  gem 'launchy'
end

group :production do
  gem 'pg', '0.18.4'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
