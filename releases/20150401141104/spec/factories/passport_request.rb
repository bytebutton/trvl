FactoryGirl.define do
  factory :passport_request do
    is_processed     { [true, false].sample }
    have_blank_pages { [true, false].sample }
    is_intact        { [true, false].sample }
    is_assistance    { [true, false].sample }
    text { Faker::Lorem.words(5).join(' ') }
  end
end
