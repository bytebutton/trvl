# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trip_destination, :class => 'Trip::Destination' do
    to_id 1
    from_id 1
    state_id 1
    province "MyString"
    purpose_id 1
    visa_id 1
    airport "MyString"
    visa_required false
    passport_required false
    date_from "2014-04-06"
    date_to "2014-04-06"
  end
end
