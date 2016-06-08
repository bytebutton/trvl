require 'spec_helper'

describe Api::V1::TripsController do
  login_user

  describe 'POST create' do

    describe 'with valid trips' do
      before { @trip = create(:trip, { :user => @user, :date_from => '2014-03-14', :date_to => '2014-04-14' }) }
      it 'Post available dates' do
        get :available_dates, { :date_from => '2014-05-14', :date_to => '2014-06-14', :trip_id => @trip.id }
        response.body.should == 'false'
      end
    end

    describe 'with invalid trips' do
      before { @trip = create(:trip, { :user => @user, :date_from => '2015-03-14', :date_to => '2015-04-14' }) }
      it 'Post available dates' do
        post :available_dates, { :date_from => '2015-03-16', :date_to => '2015-03-25', :trip_id => nil }
        response.body.should match (/These days they are busy in another trip for place/)
      end
    end

  end

end
