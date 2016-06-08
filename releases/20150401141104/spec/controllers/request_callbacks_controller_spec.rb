require 'spec_helper'

describe RequestCallbacksController do

  login_user

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new RequestCallback' do
        expect {
          post :create, :request_callback => attributes_for(:request_callback)
        }.to change(RequestCallback, :count).by(1)
      end

      it 'assigns a newly created request_callback as @request_callback' do
        post :create, :request_callback => attributes_for(:request_callback)
        assigns(:request_callback).should be_a(RequestCallback)
        assigns(:request_callback).should be_persisted
      end

      it 'redirect after success create on contact page' do
        post :create, :request_callback => attributes_for(:request_callback)
        response.should redirect_to(contact_path)
      end
    end

    describe 'with invalid params' do
      it 'redirect after fail create on contact page' do
        # Trigger the behavior that occurs when invalid params are submitted
        RequestCallback.any_instance.stub(:save).and_return(false)
        post :create, {:passport_request => {  }}
        response.should redirect_to(contact_path)
      end
    end
  end

end
