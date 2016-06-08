require 'spec_helper'

describe Country do
  it { should have_many(:states) }
  it { should have_many(:user_profiles) }
  it { should have_many(:user_profile_address_countries) }
  it { should have_many(:user_profile_home_countries) }
  it { should have_many(:user_profile_nationalities) }
  it { should have_many(:user_profile_second_nationalities) }
  it { should have_many(:user_profile_third_nationalities) }
  it { should have_many(:depart_trips) }
  it { should have_many(:travel_trips) }


  #describe '#popular_countries_by_direction' do
  #  it { expect('from_id', 10).to be_a_kind_of(Array) }
  #end

end
