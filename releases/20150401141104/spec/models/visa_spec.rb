require 'spec_helper'

describe Visa do

  let :visa do
    Visa.random_record
  end

  subject { visa }

  it { should have_many(:trips) }
  it { should have_one(:cron_visa) }
  it { should belong_to(:user) }
  it { should belong_to(:verified_admin) }
  it { should belong_to(:country) }
  it { should belong_to(:visa_entry) }
  it { should belong_to(:purpose) }

  context 'validations' do
    it { should validate_presence_of(:country_id) }
    it { should validate_presence_of(:purpose_id) }
    it { should validate_presence_of(:visa_entry_id) }
    #it { should validate_presence_of(:valid_from) }
    #it { should validate_presence_of(:expires_on) }

    it { should ensure_length_of(:number).is_at_least(4) }
    #it { should validate_uniqueness_of(:number) }
  end

  describe 'instance methods' do

    describe '#become_certified?' do
      it { expect(visa.become_certified?).to satisfy{ |resp| resp == true || resp == false } }
    end

    describe '#free_entries' do
      it { expect(visa.free_entries).to satisfy{ |resp| resp.kind_of?(Visa) || resp == false } }
    end

    describe '#certified?' do
      it { expect(visa.certified?).to satisfy{ |resp| resp == true || resp == false } }
    end

  end


  describe 'self methods' do
    describe '#available_visas' do
      it { expect(Visa.available_visas(Country.random_record_id, Country.random_record_id, Time.new - 100.years, Time.new)).to be_a_kind_of(Array) }
    end
  end
end
