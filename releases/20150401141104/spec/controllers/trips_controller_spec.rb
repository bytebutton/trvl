require 'spec_helper'


describe TripsController do

  login_user

  context 'Given a valid Trip context' do

    before do
      @passport = create(:passport, :user => @user)
      @trip = create(:trip, :user => @user)
    end

    describe 'GET index' do
      before do
        get :index, {}
      end
    end

    describe 'GET current' do
      before do
        get :current, {}
      end
      it { should_respond_with_2xx }
      it 'assigns all current trips as @trips' do
        assigns(:trips).should eq(@user.trips.current.page())
      end
    end

    describe 'GET upcoming' do
      before do
        get :upcoming, {}
      end
      it { should_respond_with_2xx }
      it 'assigns all upcoming trips as @trips' do
        assigns(:trips).should eq(@user.trips.upcoming.page())
      end
    end

    describe 'GET previous' do
      before do
        get :previous, {}
      end
      it { should_respond_with_2xx }
      it 'assigns all previous trips as @trips' do
        assigns(:trips).should eq(@user.trips.previous.page())
      end
    end

    describe 'GET deleted' do
      before do
        get :deleted, {}
      end
      it { should_respond_with_2xx }
      it 'assigns all deleted trips as @trips' do
        assigns(:trips).should eq(Kaminari.paginate_array(Trip.destroyed_objects_by_user(@user)).page())
      end
    end

    describe 'GET new' do
      before do
        get :new, {}
      end
      it { should_respond_with_2xx }
      it 'assigns a new trip as @trip' do
        assigns(:trip).should be_a_new(Trip)
      end
    end

    describe 'GET edit' do
      before do
        get :edit, {:id => @trip.to_param}
      end
      it { should_respond_with_2xx }
      it 'assigns the requested trip as @trip' do
        assigns(:trip).should eq(@trip)
      end
    end

    describe 'PUT update' do
      describe 'with valid params with Timatic API' do
        it 'updates the requested trip' do
          @attr = { :from_id => Country.random_record_id }
          put :update, {:id => @trip.to_param, :trip => @attr.merge!({:with_api_request => 'true'})}
          @trip.reload
          @trip.from_id.should eq(@trip[:from_id])
        end

        it 'assigns the requested trip as @trip' do
          put :update, {:id => @trip.to_param, :trip => attributes_for(:trip).merge!({:with_api_request => 'true'})}
          assigns(:trip).should eq(@trip)
        end

        it 'redirects to the trip' do
          put :update, {:id => @trip.to_param, :trip => attributes_for(:trip).merge!({:with_api_request => 'true'})}

          #puts @trip.valid?
          #puts @trip.with_api_request?

          response.should redirect_to(finish_trip_path(@trip))
        end
      end

      describe 'with valid params without Timatic API' do
        it 'updates the requested trip' do
          @attr = { :from_id => Country.random_record_id }
          put :update, {:id => @trip.to_param, :trip => @attr}
          @trip.reload
          @trip.from_id.should eq(@trip[:from_id])
        end

        it 'assigns the requested trip as @trip' do
          put :update, {:id => @trip.to_param, :trip => attributes_for(:trip)}
          assigns(:trip).should eq(@trip)
        end

        it 'redirects to the trip' do
          put :update, {:id => @trip.to_param, :trip => attributes_for(:trip)}
          response.should redirect_to(edit_trip_path(@trip))
        end
      end

      describe 'with invalid params without Timatic API' do
        it 'assigns the trip as @trip' do
          Trip.any_instance.stub(:save).and_return(false)
          put :update, {:id => @trip.to_param, :trip => {  }}
          assigns(:trip).should eq(@trip)
        end

        it 're-renders the "edit" template' do
          Trip.any_instance.stub(:save).and_return(false)
          put :update, {:id => @trip.to_param, :trip => {  }}
          response.should redirect_to(edit_trip_path(@trip))
        end
      end
    end

    describe 'DELETE destroy' do
      it 'destroys the requested trip' do
        expect {
          delete :destroy, {:id => @trip.to_param}
        }.to change(Trip, :count).by(-1)
      end

      it 'redirects to the trips list' do
        delete :destroy, {:id => @trip.to_param}
        response.should redirect_to(trips_url)
      end
    end

  end

end
