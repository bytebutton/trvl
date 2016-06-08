require 'spec_helper'

describe State do
  it { should belong_to(:country) }
  it { should have_many(:trips) }
end
