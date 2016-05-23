require 'spec_helper'

describe TransferSchool do
  let(:attrs) { {} }
  let!(:school) { build :transfer_school, attrs }
  subject { school }

  it { is_expected.to have_field(:title).of_type(String) }
  it { is_expected.to have_field(:city).of_type(String) }
  it { is_expected.to have_field(:state).of_type(String) }
  it { is_expected.to have_field(:code).of_type(String) }
  it { is_expected.to have_many(:transfer_courses) }

  context 'when deleted' do
    it 'should destroy it\'s related transfer_courses' do
      school = create :transfer_school
      courses = create_list :transfer_course, 5, transfer_school: school
      expect{school.destroy}.to change{TransferCourse.count}.by(-5)
    end
  end
end
