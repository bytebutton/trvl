require 'spec_helper'

describe PassportRequestsController do
  login_user

  context 'Given a valid passport request' do

    before do
      @passport_request = create(:passport_request, {:user => @user, :trip => @user.trips.last})
    end

    describe 'GET index' do
      before do
        get :index, {}
      end

      it { should_respond_with_2xx }
      it 'assigns all passport_requests as @passport_requests' do
        assigns(:passport_requests).should(eq([@passport_request]))
      end
    end

    describe 'GET show' do
      before do
        get :show, {:id => @passport_request.to_param}
      end

      it { should_respond_with_2xx }
      it 'assigns the requested passport_request as @passport_request' do
        assigns(:passport_request).should(eq(@passport_request))
      end
    end

    describe 'GET new' do
      before do
        get :new, {}
      end

      it { should_respond_with_2xx }
      it 'assigns a new passport_request as @passport_request' do
        assigns(:passport_request).should(be_a_new(PassportRequest))
      end
    end

    describe 'POST create' do
      describe 'with valid params' do

        it 'creates a new PassportRequest' do
          expect {
            post :create, attributes_for(:passport_request)
          }.to(change(PassportRequest, :count).by(1))
        end

        it 'assigns a newly created passport_request as @passport_request' do
          post :create, attributes_for(:passport_request)
          assigns(:passport_request).should(be_a(PassportRequest))
          assigns(:passport_request).should(be_persisted)
        end

        it 'redirects to the created passport_request' do
          post :create, attributes_for(:passport_request)
          response.should redirect_to(edit_user_path(@user))
        end

      end
    end

    describe 'DELETE destroy' do
      it 'destroys the requested passport_request' do
        expect {
          delete(:destroy, {:id => @passport_request.to_param})
        }.to change(PassportRequest, :count).by(-1)
      end

      it 'redirects to the passport_requests list' do
        delete(:destroy, {:id => @passport_request.to_param})
        response.should(redirect_to(passport_requests_url))
      end
    end

  end

end
