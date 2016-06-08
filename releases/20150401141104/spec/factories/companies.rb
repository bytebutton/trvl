FactoryGirl.define do
  factory :company do
    name { Faker::Company.name }
    description { 'test description' }
  end
end