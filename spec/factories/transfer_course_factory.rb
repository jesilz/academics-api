FactoryGirl.define do
  factory :transfer_course do
    sequence(:title) { |n| "Some course #{n}" }
    subject "BUS"
    sequence(:number) { |n| n }
    biola_course_subject "BUSN"
    sequence(:biola_course_number) { |n| n }
    biola_course_title "Marketing Basics"
    transfer_school
  end
end
