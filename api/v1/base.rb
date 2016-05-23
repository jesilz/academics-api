module AcademicsAPI
  module V1
    class Base < Grape::API

      version 'v1' # path-based versioning by default
      format :json # We don't like xml anymore

      # Like it sounds... 404 if Mongoid returns DocumentNotFound
      rescue_from Mongoid::Errors::DocumentNotFound do |e|
        Rack::Response.new([{error: '404 Not Found'}.to_json], 404, {'Content-type' => 'application/json'})
      end

      # handle exceptions, used for error notifications
      rescue_from :all do |e|
        if defined? Raven
          Raven.capture_exception(e)
          error_response(message: "Internal server error", status: 500)
        else
          raise e
        end
      end
        
      # APIs
      mount TransferSchoolsAPI
    end
  end
end
