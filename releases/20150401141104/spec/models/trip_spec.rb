require 'spec_helper'

describe Trip do
  before(:each) do
    @user = create(:user)
    #10.times{ create(:trip,{ :user => @user }) }
    @trip = create(:trip,{ :user => @user })
  end
  subject { @trip }

  it { should have_one(:passport_request) }
  it { should belong_to(:purpose) }
  it { should belong_to(:to) }
  it { should belong_to(:from) }
  it { should belong_to(:state) }
  it { should belong_to(:visa) }

  # validate
  context 'validations' do
    #it { should validate_presence_of(:date_from) }
    #it { should validate_presence_of(:date_to) }
    it { should validate_presence_of(:purpose_id) }
    it { should validate_presence_of(:from_id) }
    it { should validate_presence_of(:to_id) }
  end

  describe 'instance methods' do

    describe '#days_busy' do
      it { expect(@trip.days_busy).to be_kind_of(String)}
    end

    describe '#duration_of_stay' do
      it { expect(@trip.duration_of_stay).to be_kind_of(Fixnum)}
    end

    describe '#dates_range' do
      it { expect(@trip.dates_range).to be_kind_of(String)}
    end

    describe '#with_api_request?' do
      it { expect(@trip.with_api_request?).to satisfy{ |resp| resp == true || resp == false } }
    end

    describe '#visa_required?' do
      it { expect(@trip.visa_required?).to satisfy{ |resp| resp == true || resp == false }}
    end

    describe '#passport_required?' do
      it { expect(@trip.passport_required?).to satisfy{ |resp| resp == true || resp == false }}
    end

    describe '#home_country?' do
      it { expect(@trip.home_country?).to satisfy{ |resp| resp == true || resp == false }}
    end

    #describe '#visa_for_trip' do
    #  it { expect(@trip.visa_for_trip).to satisfy { |resp| resp.nil? || resp.kind_of?(Visa) } }
    #end

    #describe '#validate_available_dates' do
    #  it { expect(@trip.validate_available_dates).to raise_error }
    #end
  end

  describe 'self methods' do

    describe '#previous' do
      it { expect(Trip.previous).to be_kind_of(ActiveRecord::Relation)}
    end

    describe '#current' do
      it { expect(Trip.current).to be_kind_of(ActiveRecord::Relation)}
    end

    describe '#upcoming' do
      it { expect(Trip.upcoming).to be_kind_of(ActiveRecord::Relation)}
    end

    describe '#in_dates' do
      it { expect(Trip.in_dates(Time.new - 100.years, Time.new, @trip )).to satisfy { |resp| resp.nil? || resp.kind_of?(Trip) } }
    end

  end
end
