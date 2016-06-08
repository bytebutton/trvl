require 'spec_helper'

describe PassportsController do

  login_user

  context 'Given a valid passport' do

    before do
      @passport = create(:passport, {:user => @user})
    end

    describe 'GET index' do
      before do
        get :index, {}
      end
    end

    describe 'GET my' do
      before do
        get :index, {}
      end

      it { should_respond_with_2xx }
      it 'assigns all passports as @passports' do
        assigns(:passports).should eq(@user.passports.load)
      end
    end

    describe 'GET show' do
      before do
        get :show, {:id => @passport.to_param}
      end

      it { should_respond_with_2xx }
      it 'assigns the requested passport as @passport' do
        assigns(:passport).should eq(@passport)
      end
    end

    describe 'GET new' do
      before do
        get :new, {}
      end

      it { should_respond_with_2xx }
      it 'assigns a new passport as @passport' do
        assigns(:passport).should be_a_new(Passport)
      end
    end

    describe 'GET edit' do
      before do
        get :edit, {:id => @passport.to_param}
      end

      it { should_respond_with_2xx }
      it 'assigns the requested passport as @passport' do
        assigns(:passport).should eq(@passport)
      end
    end

    describe 'POST create' do
      describe 'with valid params' do
        it 'creates a new Passport' do
          expect {
            post :create, :passport => attributes_for(:passport)
          }.to change(Passport, :count).by(1)
        end

        it 'assigns a newly created passport as @passport' do
          post :create, :passport => attributes_for(:passport)
          assigns(:passport).should be_a(Passport)
          assigns(:passport).should be_persisted
        end

        it 'redirects to the created passport' do
          post :create, :passport => attributes_for(:passport)
          response.should redirect_to(Passport.last)
        end
      end

      describe 'with invalid params' do
        it 'assigns a newly created but unsaved passport as @passport' do
          # Trigger the behavior that occurs when invalid params are submitted
          Passport.any_instance.stub(:save).and_return(false)
          post :create, {:passport => {  }} 
          assigns(:passport).should be_a_new(Passport)
        end

      end
    end

    describe 'PUT update' do
      describe 'with valid params' do
        it 'updates the requested passport' do
          @attr = { :number => "Test update #{rand(1000)}" }
          put :update, :id => @passport.to_param, :passport => @attr
          @passport.reload
          @passport.number.should eq(@attr[:number])
        end

        it 'assigns the requested passport as @passport' do
          put :update, {:id => @passport.to_param, :passport => @passport.attributes}
          assigns(:passport).should eq(@passport)
        end

        it 'redirects to the passport' do
          put :update, {:id => @passport.to_param, :passport => @passport.attributes}
          response.should redirect_to(@passport)
        end
      end

      describe 'with invalid params' do
        it 'assigns the passport as @passport' do
          Passport.any_instance.stub(:save).and_return(false)
          put :update, {:id => @passport.to_param, :passport => {  }}
          assigns(:passport).should eq(@passport)
        end

        it 're-renders the "edit" template' do
          Passport.any_instance.stub(:save).and_return(false)
          put :update, {:id => @passport.to_param, :passport => {  }}
          response.should render_template(nil)
        end
      end
    end

    describe 'DELETE destroy' do
      it 'destroys the requested passport' do
        expect {
          delete :destroy, {:id => @passport.to_param}
        }.to change(Passport, :count).by(-1)
      end

      it 'redirects to the passports list' do
        delete :destroy, {:id => @passport.to_param}
        response.should redirect_to(passports_url)
      end
    end

  end

end
