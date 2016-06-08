require 'spec_helper'

describe ContactController do
  login_user

  context 'Given a valid user' do

    describe 'GET index' do
      before do
        get :index, {}
      end

      it 'assigns a new  secure message and request callback as @secure_message and @request_callback respectively' do
        assigns(:secure_message).should be_a_new(SecureMessage)
        assigns(:request_callback).should be_a_new(RequestCallback)
      end
    end

  end

end