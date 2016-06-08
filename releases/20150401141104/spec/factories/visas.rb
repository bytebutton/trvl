FactoryGirl.define do
  factory :visa do
    country_id { Country.random_record_id }
    purpose_id { Purpose.random_record_id }
    number     { Faker::Lorem.characters(10) }
    visa_entry_id { VisaEntry.random_record_id }
    is_certified { [true, false].sample }
    verified_admin_id { User.admins.random_record_id }
    valid_from { Date.current }
    expires_on { Date.current + 1.year }
    verified_date { Date.current + 1.day }
  end
end
