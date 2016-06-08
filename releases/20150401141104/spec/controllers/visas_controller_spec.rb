require 'spec_helper'

describe VisasController do

  login_user

  context 'Given a valid Visa context' do

    before do
      @visa = create(:visa, :user => @user)
    end

    describe 'GET index' do
      before do
        get :index, {}
      end
      it { should_respond_with_2xx }
      it 'assigns all visas as @visas' do
        assigns(:visas).should eq([@visa])
      end
    end

    describe 'GET show' do
      before do
        get :show, {:id => @visa.to_param}
      end
      it { should_respond_with_2xx }
      it 'assigns the requested visa as @visa' do
        assigns(:visa).should eq(@visa)
      end
    end

    describe 'GET new' do
      before do
        get :new, {}
      end
      it { should_respond_with_2xx }
      it 'assigns a new visa as @visa' do
        assigns(:visa).should be_a_new(Visa)
      end
    end

    describe 'GET edit' do
      before do
        get :edit, {:id => @visa.to_param}
      end
      it { should_respond_with_2xx }
      it 'assigns the requested visa as @visa' do
        assigns(:visa).should eq(@visa)
      end
    end

    describe 'POST create' do

      describe 'with valid params' do
        it 'creates a new Visa' do
          expect {
            post :create, {:visa => attributes_for(:visa)}
          }.to change(Visa, :count).by(1)
        end

        it 'assigns a newly created visa as @visa' do
          post :create, {:visa => attributes_for(:visa)}
          assigns(:visa).should be_a(Visa)
          assigns(:visa).should be_persisted
        end

        it 'redirects to the created visa' do
          post :create, {:visa => attributes_for(:visa)}
          response.should redirect_to(Visa.last)
        end
      end

      describe 'with invalid params' do
        it 'assigns a newly created but unsaved visa as @visa' do
          Visa.any_instance.stub(:save).and_return(false)
          post :create, {:visa => { }}
          assigns(:visa).should be_a_new(Visa)
        end

        it 're-renders template' do
          Visa.any_instance.stub(:save).and_return(false)
          post :create, {:visa => { }}
          response.should redirect_to(visas_path)
        end
      end

    end

    describe 'PUT update' do

      describe 'with valid params' do
        it 'updates the requested visa' do
          @attr = { :number => Faker::Lorem.characters(10) }
          put :update, {:id => @visa.to_param, :visa => @attr}
          @visa.reload
          @visa.number.should eq(@attr[:number])
        end

        it 'assigns the requested visa as @visa' do
          put :update, {:id => @visa.to_param, :visa => attributes_for(:visa)}
          assigns(:visa).should eq(@visa)
        end

        it 'redirects to the visa' do
          put :update, {:id => @visa.to_param, :visa => attributes_for(:visa)}
          response.should redirect_to(@visa)
        end
      end

      describe 'with invalid params' do
        it 'assigns the visa as @visa' do
          Visa.any_instance.stub(:save).and_return(false)
          put :update, {:id => @visa.to_param, :visa => {  }}
          assigns(:visa).should eq(@visa)
        end

        it 're-renders the template' do
          Visa.any_instance.stub(:save).and_return(false)
          put :update, {:id => @visa.to_param, :visa => {  }}
          response.should redirect_to(@visa)
        end
      end

    end

    describe 'DELETE destroy' do
      it 'destroys the requested visa' do
        expect {
          delete :destroy, {:id => @visa.to_param}
        }.to change(Visa, :count).by(-1)
      end

      it 'redirects to the visas list' do
        delete :destroy, {:id => @visa.to_param}
        response.should redirect_to(visas_url)
      end
    end

  end

end
