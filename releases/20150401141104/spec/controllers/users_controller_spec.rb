require 'spec_helper'

describe UsersController do

  login_user

  context 'Given a valid User context' do

    describe 'GET edit' do
      before do
        get :edit, {:id => @user.to_param}
      end
      it { should_respond_with_2xx }
      it 'assigns the requested user as @user' do
        assigns(:user).should eq(@user)
      end
    end

    describe 'PUT update' do

      describe 'with valid params' do
        it 'updates the requested user' do
          @attr = { :profile_attributes => {:first_name => Faker::Lorem.characters(10)} }
          put :update, {:id => @user.to_param, :user => @attr}
          @user.reload
          @user.profile.first_name.should eq(@attr[:profile_attributes][:first_name])
        end

        it 'assigns the requested user as @user' do
          put :update, {:id => @user.to_param, :user => attributes_for(:user)}
          assigns(:user).should eq(@user)
        end

        it 'redirects to the user' do
          put :update, {:id => @user.to_param, :user => attributes_for(:user)}
          response.should redirect_to(edit_user_path(@user))
        end
      end

      describe 'with invalid params' do
        it 'assigns the user as @user' do
          User.any_instance.stub(:save).and_return(false)
          put :update, {:id => @user.to_param, :user => {  }}
          assigns(:user).should eq(@user)
        end

        it 're-renders the "edit" template' do
          User.any_instance.stub(:save).and_return(false)
          put :update, {:id => @user.to_param, :user => {  }}
          response.should redirect_to(edit_user_path(@user))
        end
      end

    end

  end

end
