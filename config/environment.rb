# This file should be included by irb, sidekiq or just about anything else.
# It is the initializer for this project.
ENV['RACK_ENV'] ||= 'development'

# Load application.rb
require File.expand_path('../application', __FILE__)

