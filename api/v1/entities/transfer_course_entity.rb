module AcademicsAPI
  module V1
    class TransferCourseEntity < Grape::Entity
      expose(:id) { |object| object.id.to_s }
      expose :title
      expose :subject
      expose :number
      expose :biola_course_subject
      expose :biola_course_number
      expose :biola_course_title
    end
  end
end
