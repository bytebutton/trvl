FactoryGirl.define do
  factory :secure_message do
    text { Faker::Lorem.words(5).join(' ') }
  end
end
