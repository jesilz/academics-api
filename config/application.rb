require File.expand_path('../boot', __FILE__)

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'api'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'mongoid'
require 'active_support'
require 'rack/turnout'

Bundler.require :default, ENV['RACK_ENV']

module AcademicsAPI
  extend ActiveSupport::Autoload

  # The environment the application is running in. Looks for a RACK_ENV or
  #   RAILS_ENV environment variable, otherwise it's :development by default
  # @return [Symbol]
  def self.environment
    (ENV['RACK_ENV'] || ENV['RAILS_ENV'] || :development).to_sym
  end

  # Initializes everything that is needed for the application to run - settings
  #   databases, models, apis, workers, etc. Also requires all the needed files and libraries.
  # @return [true]
  def self.initialize!
    ENV['RACK_ENV'] ||= environment.to_s

    Config.load_and_set_settings('./config/settings.yml', "./config/settings/#{environment}.yml", './config/settings.local.yml')

    # Use mongoid.yml.example for Travis CI, etc.
    mongoid_yml_path = File.expand_path('../../config/mongoid.yml',  __FILE__)
    mongoid_yml_path = "#{mongoid_yml_path}.example" if !File.exists? mongoid_yml_path
    Mongoid.load! mongoid_yml_path

    if defined? Raven
      Raven.configure do |config|
        config.dsn = Settings.sentry.url
      end
    end

    Turnout.configure do |config|
      config.named_maintenance_file_paths.merge! server: '/tmp/turnout.yml'
      config.default_maintenance_page = Turnout::MaintenancePage::JSON
    end

    file_paths = ['./api/*.rb', './app/models/*.rb', './lib/*.rb', './app/*.rb']
    Dir.glob(file_paths).each do |f| 
      require f
    end

    true
  end

  # Configuration block for the pinglish gem
  # @return [nil]
  def self.pinglish_block
    Proc.new do |ping|
      ping.check :mongodb do
        Mongoid.default_client.command(ping: 1).documents.any?{|d| d == {'ok' => 1}}
      end

      nil
    end
  end

end

AcademicsAPI.initialize!
