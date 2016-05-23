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

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  # Clean/Reset Mongoid DB prior to running each test.
  config.before(:each) do
    Mongoid::Clients.default.collections.select {|c| c.name !~ /system/ }.each(&:drop)
  end
end
