require 'spec_helper'

describe Company do
  ##through
  it { should have_and_belong_to_many(:managers) }
  it { should have_and_belong_to_many(:users) }

  it { should have_many(:trips).through(:users) }
  it { should have_many(:visas).through(:users) }
  it { should have_many(:passports).through(:users) }

  ##validates
  it { should validate_presence_of(:name) }
end
