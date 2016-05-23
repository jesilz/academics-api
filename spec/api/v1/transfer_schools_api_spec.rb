require 'spec_helper'

describe '/v1/transfer_schools' do
  include Rack::Test::Methods

  def app
    AcademicsAPI::V1::TransferSchoolsAPI
  end

  context 'GET /v1/transfer_schools' do
    it 'returns an empty array of schools' do
      get '/v1/transfer_schools'
      expect(last_response.status).to eq(200)
      expect(JSON.parse(last_response.body)).to eq []
    end
  end

  context 'GET /v1/transfer_schools/:id' do
    let(:transfer_school) { create :transfer_school }
    let(:json_response) { {
      "id"=>transfer_school.id.to_s, 
      "title"=>transfer_school.title, 
      "city"=>transfer_school.city, 
      "state"=>transfer_school.state } }

    it 'returns a school by id' do
      get "/v1/transfer_schools/#{transfer_school.id}"
      expect(last_response.status).to eq(200)
      expect(JSON.parse(last_response.body)).to eq json_response
    end
  end

  context 'GET /v1/transfer_schools/:id/courses' do
    let(:transfer_school) { create :transfer_school }
    let!(:courses) { create_list :transfer_course, 2, transfer_school: transfer_school}
    let(:json_response) { courses.collect {|c| {
      "id"=>c.id.to_s, 
      "title"=>c.title,
      "subject"=>c.subject,
      "number"=>c.number,
      "biola_course_subject"=>c.biola_course_subject,
      "biola_course_number"=>c.biola_course_number,
      "biola_course_title"=>c.biola_course_title } } }
  
    it 'returns a list of transfer courses for a given school by id' do
      get "/v1/transfer_schools/#{transfer_school.id}/courses"
      expect(last_response.status).to eq(200)
      expect(JSON.parse(last_response.body)).to eq json_response
    end
  end

end
