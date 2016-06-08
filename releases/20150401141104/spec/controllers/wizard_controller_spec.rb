require 'spec_helper'

describe WizardController do

  login_user

  context 'Given a valid User' do

    describe 'GET show' do
      before do
        get :show, {:id => 'step1'}
      end
      it { should_respond_with_2xx }
      it 'assigns the requested user as @user' do
        assigns(:user).should eq(@user)
      end
    end

    describe 'PUT update' do
      steps = %w(change_password step1 step2 step3 license)

      describe 'with valid params' do
        it 'wizard change password updates' do
          old_password = @user.encrypted_password
          @attr = { :password => '123123123', :password_confirmation => '123123123'}
          put :update, {:id => 'change_password', :user => @attr}
          @user.reload
          @user.encrypted_password.should_not == old_password
        end

        it 'step1 updates' do
          @attr = { :profile_attributes => { 'first_name' => 'First', 'last_name' => 'Last', 'mobile_phone_number' => Faker::PhoneNumber.short_phone_number } }
          put :update, {:id => 'step1', :user => @attr}
          @user.reload
          @user.profile.attributes.should include(@attr[:profile_attributes])
        end

        it 'step2 updates' do
          @attr = {
              :profile_attributes => {
                  'home_address_line_1' => Faker::Address.street_address,
                  'home_city'           => Faker::Address.city,
                  'home_country_id'     => Country.random_record_id,
                  'home_postal_code'    => Faker::AddressUS.zip_code
              }
          }
          put :update, { :id => 'step2', :user => @attr }
          @user.reload
          @user.profile.attributes.should include(@attr[:profile_attributes])
        end

        it 'step3 updates' do
          @attr = {:profile_attributes => {}}
          put :update, { :id => 'step3', :user => @attr }
          @user.reload
          @user.profile.attributes.should include(@attr[:profile_attributes])
        end

        it 'license updates' do
          @attr = { 'is_agreed_terms' => '1' }
          put :update, { :id => 'license', :user => @attr }
          @user.reload
          @user.is_agreed_terms.should be_true
        end

        steps.each do |step|
          it "assigns the requested visa as @user for #{step}" do
            put :update, {:id => step, :user => attributes_for(:user)}
            assigns(:user).should eq(@user)
          end
          it "redirects to the wizard for #{step}" do
            put :update, {:id => step, :visa => attributes_for(:visa)}
            if step == 'license'
              response.should redirect_to(wizard_path('wicked_finish'))
            else
              response.should redirect_to(wizard_path(steps[steps.index(step) + 1]))
            end
          end
        end

      end

      describe 'with invalid params' do
        it 'wizard change password updates' do
          old_password = @user.encrypted_password
          @attr = { :password => '123', :password_confirmation => '23' }
          put :update, {:id => 'change_password', :user => @attr}
          @user.reload
          @user.encrypted_password.should == old_password
        end

        it 'step1 updates' do
          @attr = { :profile_attributes => { 'first_name' => '', 'last_name' => '' } }
          put :update, {:id => 'step1', :user => @attr}
          @user.reload
          @user.profile.attributes.should_not include(@attr[:profile_attributes])
        end

        it 'step2 updates' do
          @attr = { :profile_attributes => { 'home_address_line_1' => '', 'home_city' => '', 'home_country_id' => '', 'home_postal_code'  => ''}}
          put :update, { :id => 'step2', :user => @attr }
          @user.reload
          @user.profile.attributes.should_not include(@attr[:profile_attributes])
        end

        (steps - %w(license1 step3)).each do |step|
          it "re-renders the template for #{step}" do
            put :update, { :id => step, :user => { :profile_attributes => { :first_name => '', :home_city => '' }, :password => '' } }
            response.should_not redirect_to(wizard_path(steps[steps.index(step) + 1]))
          end
        end

      end
    end

  end

end
