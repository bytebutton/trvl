FactoryGirl.define do
  factory :passport do
    passport_type_id { PassportType.random_record_id }
    country_id       { Country.random_record_id }
    number           { "test #{ Passport.last.id + 1 }" }
    valid_from       { Date.current }
    expires_on       { Date.current + 3.years }
    issued_by        { Faker::Lorem.word }
    is_primary       { true }
  end
end