require ::File.expand_path('../config/environment',  __FILE__)

env = ENV['RACK_ENV']

file = File.new("./log/#{env}.log", 'a+')
file.sync = true
use Rack::CommonLogger, file
use Rack::Turnout
use Pinglish, &AcademicsAPI.pinglish_block

map ENV['PUMA_RELATIVE_URL_ROOT'] || '/' do
  run AcademicsAPI::API
end
