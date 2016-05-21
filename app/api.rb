module AcademicsAPI
  class API < Grape::API
    mount AcademicsAPI::V1::Base
  end
end
