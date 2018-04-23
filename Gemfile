source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'twitter-bootstrap-rails'

gem 'rails', '~> 5.1.5'

gem 'uglifier', '>= 1.3.0'

gem 'jquery-rails'


group :development, :test do
  gem 'sqlite3'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'listen'
end
