source 'https://rubygems.org'

gem 'config' # manage environment-specific configurations
gem 'grape' # API Framework
gem 'grape-entity' # API Framework
gem 'mongoid', '~> 5.1' # Mongo DB
#gem 'newrelic_rpm' # performance monitoring
gem 'pinglish' # health check
gem 'puma' # web server
gem 'turnout' # maintenance mode

group :test do
  gem 'factory_girl'
  gem 'faker'
  gem 'mongoid-rspec', '~> 3.0'
  gem 'pry'
  gem 'pry-rescue'
  gem 'pry-stack_explorer'
  gem 'rack-test'
  gem 'rspec'
end

group :production do
  gem 'sentry-raven'
end
