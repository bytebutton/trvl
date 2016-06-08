require 'spec_helper'

describe User do

  before(:each) { @user = User.random_record }

  it { should have_one(:profile) }
  it { should have_many(:trips) }
  it { should have_many(:visas) }
  it { should have_many(:passports) }
  it { should have_many(:secure_messages) }
  it { should have_many(:request_callbacks) }
  it { should have_many(:passport_requests) }
  it { should have_and_belong_to_many(:companies) }

  it { should accept_nested_attributes_for(:profile).update_only(true) }

  #validate
  it { should validate_confirmation_of(:password) }

  describe 'instance methods' do
    describe '#full_name' do
      it { expect(@user.full_name).to be_kind_of(String) }
    end

    describe '#companies_list' do
      it { expect(@user.companies_list).to be_kind_of(String) }
    end

    describe '#manager?' do
      it { expect(@user.manager?).to satisfy{ |resp| resp == true || resp == false } }
    end

    describe '#admin?' do
      it { expect(@user.admin?).to satisfy{ |resp| resp == true || resp == false } }
    end

    describe '#agreed_terms?' do
      it { expect(@user.admin?).to satisfy{ |resp| resp == true || resp == false } }
    end

    describe '#passport' do
      it { expect(@user.passport).to satisfy{ |resp| resp.kind_of?(Passport) || resp.nil?} }
    end

    describe '#has_passport?' do
      it { expect(@user.has_passport?).to satisfy{ |resp| resp == true || resp == false } }
    end

    describe '#passport_request' do
      it { expect(@user.passport_request).to satisfy{ |resp| resp.kind_of?(PassportRequest) || resp.nil?} }
    end

    describe '#has_passport_request?' do
      it { expect(@user.has_passport_request?).to satisfy{ |resp| resp == true || resp == false }}
    end
  end

  describe 'self methods' do
    describe '#admins' do
      it { expect(User.admins).to be_a_kind_of(ActiveRecord::Relation) }
    end
  end

end
