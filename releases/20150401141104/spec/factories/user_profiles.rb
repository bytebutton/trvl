FactoryGirl.define do
  factory :user_profile, :class => User::Profile do
    first_name            { Faker::Name.first_name }
    last_name             { Faker::Name.last_name }
    dob                   { Time.new - rand(18..50).years }
    mobile_phone_number   { Faker::PhoneNumber.short_phone_number }
    company               { Faker::Company.name }
    hr_manager            { Faker::Name.name }
    hr_manager_email      { Faker::Internet.email }
    gender                { %w(male female).sample }
    country_id            { Country.random_record_id }
    nationality_id        { Country.random_record_id }
    job_title             { 'Developer' }
    #avatar              {"eastern_bay_of_plenty-wide.jpg"}
    second_nationality_id { Country.random_record_id }
    state_id              { State.random_record_id }
    address_country_id    { Country.random_record_id }
    #address_province      { Faker::Address.state }
    address_city          { Faker::Address.city }
    work_address_line_2   { Faker::Address.street_address }
    work_address_line_1   { Faker::Address.street_address }
    home_city             { Faker::Address.city }
    home_postal_code      { Faker::AddressUS.zip_code }
    postal_code           { Faker::AddressUS.zip_code }
    home_address_province { Faker::Address.street_address }
    home_state_id         { State.random_record_id }
    home_country_id       { Country.random_record_id }
    home_address_line_2   { Faker::Address.street_address }
    home_address_line_1   { Faker::Address.street_address }
    secondary_email       { Faker::Internet.email }
    third_nationality_id  { Country.random_record_id }
    #vaccination_certificate {"Flower-Vintage-Background-640x400.jpg"}
    has_more_nationality { [ false, true ].sample }
  end
end
