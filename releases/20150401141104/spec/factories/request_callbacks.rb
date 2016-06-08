FactoryGirl.define do
  factory :request_callback do
    is_processed { [true, false].sample }
    phone { Faker::PhoneNumber.short_phone_number }
  end
end
