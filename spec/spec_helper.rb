ENV['RACK_ENV'] = 'test'

require File.expand_path("../../config/environment", __FILE__)

require 'bundler/setup'
require 'rspec'
require 'rack/test'
require 'factory_girl'
require 'pry'

FactoryGirl.find_definitions

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Mongoid::Matchers

  # Clean/Reset Mongoid DB prior to running each test.
  config.before(:each) do
    Mongoid::Clients.default.collections.select {|c| c.name !~ /system/ }.each(&:drop)
  end
end
