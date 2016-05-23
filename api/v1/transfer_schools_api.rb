module AcademicsAPI
  module V1
    class TransferSchoolsAPI < Grape::API
      resource :transfer_schools do
        desc 'Return a list of transfer schools'
        get do
          schools = TransferSchool.all
          present schools, with: TransferSchoolEntity
        end

        desc "Return a single school by id" 
        get '/:id' do
          school = TransferSchool.find(params[:id])
          present school, with: TransferSchoolEntity
        end

        desc "Return list of courses for given school by id" 
        get '/:id/courses' do
          school = TransferSchool.find(params[:id])
          present school.transfer_courses, with: TransferCourseEntity
        end

      end
    end
  end
end
