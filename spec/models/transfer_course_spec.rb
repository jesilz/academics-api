require 'spec_helper'

describe TransferCourse do
  it { is_expected.to have_field(:title).of_type(String) }
  it { is_expected.to have_field(:subject).of_type(String)}
  it { is_expected.to have_field(:number).of_type(Integer)}
  it { is_expected.to have_field(:title).of_type(String)}
  it { is_expected.to have_field(:biola_course_subject).of_type(String)}
  it { is_expected.to have_field(:biola_course_number).of_type(Integer)}
  it { is_expected.to have_field(:biola_course_title).of_type(String)}
  it { is_expected.to belong_to(:transfer_school) }
end
