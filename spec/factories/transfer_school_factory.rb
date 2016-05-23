FactoryGirl.define do
  factory :transfer_school do
    sequence(:title) { |n| Faker::Commerce.department+"#{n}" }
    city "Los Angeles"
    state "California"
    code "1234"
  end
end
