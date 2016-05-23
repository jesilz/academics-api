module AcademicsAPI
  module V1
    class TransferSchoolEntity < Grape::Entity
      expose(:id) { |object| object.id.to_s }
      expose :title
      expose :city
      expose :state
    end
  end
end
