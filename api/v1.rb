module AcademicsAPI
  module V1
    # autoload files as you add them to the /api/v1 directory
    autoload :Base, File.expand_path('../v1/base', __FILE__)
  end
end
