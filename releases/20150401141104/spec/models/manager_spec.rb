require 'spec_helper'

describe Manager do
  it { should have_and_belong_to_many(:companies) }
  it { should have_many(:users) }
end
