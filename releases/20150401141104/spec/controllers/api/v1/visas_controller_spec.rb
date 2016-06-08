require 'spec_helper'

describe Api::V1::VisasController do
  login_user

  describe 'with valid visas' do
    country = Country.random_record
    purpose = Purpose.random_record

    before { @visa = create(:visa, { :user => @user, :purpose_id => purpose.id, :country_id => country.id, :valid_from => '2014-03-14', :expires_on => '2015-04-14' }) }

    it 'Post with valid data' do
      get :available_visas, { :country_id => country.id, :purpose_id => purpose.id, :valid_from => '2014-04-14', :expires_on => '2014-04-24'}
      JSON.parse(response.body)['visa']['id'].should == @visa.id
    end
  end

  describe 'with valid visas' do
    it 'Post with valid data' do
      get :available_visas, { :country_id => Country.random_record_id, :purpose_id => Purpose.random_record_id, :valid_from => '2019-04-14', :expires_on => '2020-04-24'}
      JSON.parse(response.body)['visa'].should be_nil
    end
  end

end