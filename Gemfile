source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 6.0.1'
gem 'sqlite3', '~> 1.4'
gem 'puma', '~> 4.1'
gem 'graphql'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'rack-cors'
gem 'omniauth-google-oauth2'
gem "figaro"
gem 'devise'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'faker'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
