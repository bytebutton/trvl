FactoryGirl.define do
  factory :trip do
    to_id { Country.random_record_id }
    from_id { Country.random_record_id }
    province { Faker::Lorem.characters(25) }
    purpose_id { Purpose.random_record_id }
    airport { Faker::Lorem.word }
    state_id { State.random_record_id }
    date_from { ( Trip.last.andand.date_from || Time.current ) + 10.month }
    date_to   { ( Trip.last.andand.date_from || Time.current ) + 12.month  }
    with_api_request { false }
  end
end
