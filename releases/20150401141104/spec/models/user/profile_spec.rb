require 'spec_helper'

describe User::Profile do
  before(:each) { @user = create(:user) }
  subject { @user.profile }

  it { should belong_to(:user) }
  it { should belong_to(:country) }
  it { should belong_to(:nationality) }
  it { should belong_to(:second_nationality) }
  it { should belong_to(:third_nationality) }
  it { should belong_to(:home_state) }
  it { should belong_to(:home_country) }
  it { should belong_to(:state) }
  it { should belong_to(:address_country) }

  # validates
  context  'validations' do
    it { should ensure_inclusion_of(:gender).in_array(%w(male female)) }

    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:mobile_phone_number) }

    it { should validate_presence_of(:home_address_line_1) }
    it { should validate_presence_of(:home_city) }
    it { should validate_presence_of(:home_postal_code) }
    it { should validate_presence_of(:home_country) }
  end

end
