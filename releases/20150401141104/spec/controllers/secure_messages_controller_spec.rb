require 'spec_helper'

describe SecureMessagesController do

  login_user

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new SecureMessage' do
        expect {
          post :create, :secure_message => attributes_for(:secure_message)
        }.to change(SecureMessage, :count).by(1)
      end

      it 'assigns a newly created secure_message as @secure_message' do
        post :create, :secure_message => attributes_for(:secure_message)
        assigns(:secure_message).should be_a(SecureMessage)
        assigns(:secure_message).should be_persisted
      end

      it 'redirects to the created secure_message' do
        post :create, :secure_message => attributes_for(:secure_message)
        response.should redirect_to(contact_path)
      end
    end

    describe 'with invalid params' do
      it 'redirect after failed creating on contact page' do
        # Trigger the behavior that occurs when invalid params are submitted
        SecureMessage.any_instance.stub(:save).and_return(false)
        post :create, :secure_message => { }
        response.should redirect_to(contact_path)
      end
    end
  end

end
