require 'spec_helper'

describe Passport do
  before(:each) { @passport = Passport.random_record }
  subject { @passport }

  it { should have_one(:cron_passport) }
  it { should belong_to(:user) }
  it { should belong_to(:passport_type) }
  it { should belong_to(:country) }

  # validates
  context  'validations' do
    it { should validate_presence_of(:country_id) }
    it { should validate_presence_of(:number) }
    it { should validate_presence_of(:passport_type_id) }
    #it { should validate_presence_of(:valid_from) }
    #it { should validate_presence_of(:expires_on) }
  end

  describe 'instance methods' do

    describe '#primary?' do
      it { expect(@passport.primary?).to satisfy{ |resp| resp == true || resp == false } }
    end

    describe '#old?' do
      it { expect(@passport.old?).to satisfy{ |resp| resp == true || resp == false }}
    end

    describe '#passport_become_primary?' do
      it { expect(@passport.passport_become_primary?).to satisfy{ |resp| resp == true || resp == false } }
    end

    describe '#should_be_primary?' do
      it { expect(@passport.should_be_primary?).to satisfy{ |resp| resp == true || resp == false } }
    end

    describe '#determine_primary_passport' do
      it { expect(@passport.should_be_primary?).to satisfy{ |resp| resp == true || resp == false } }
    end

  end

end