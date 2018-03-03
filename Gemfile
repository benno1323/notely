source 'https://rubygems.org'
ruby '2.5.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails',          '5.1.4'
gem 'pg', '0.18.4'
gem 'puma',           '3.9.1'
gem 'rails_12factor', group: :production
gem 'devise', '~> 4.2'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '4.2.2'
gem 'jquery-rails', '4.3.1'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

group :development, :test do
  gem 'byebug'
  gem 'better_errors'
end

group :development do
  gem 'web-console', '3.5.1'
  gem 'listen',                '3.1.5'
  gem 'spring',                '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
  gem 'spring-commands-rspec', '1.0.4'
end

group :test do
  gem 'faker'
	gem 'capybara'
	gem 'selenium-webdriver', '~> 3.10'
	gem 'database_cleaner'
  gem 'launchy'
  gem 'rspec-rails', '3.7.2'
  gem 'factory_bot_rails',  '4.8.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
