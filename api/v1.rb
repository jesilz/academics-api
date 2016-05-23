module AcademicsAPI
  module V1
    # autoload files as you add them to the /api/v1 directory
    autoload :Base, File.expand_path('../v1/base', __FILE__)
    autoload :TransferSchoolsAPI, File.expand_path('../v1/transfer_schools_api', __FILE__)
    autoload :TransferSchoolEntity, File.expand_path('../v1/entities/transfer_school_entity', __FILE__)
    autoload :TransferCourseEntity, File.expand_path('../v1/entities/transfer_course_entity', __FILE__)
  end
end
