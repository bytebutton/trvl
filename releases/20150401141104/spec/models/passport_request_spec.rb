require 'spec_helper'

describe PassportRequest do
  it { should belong_to(:user) }
  it { should belong_to(:trip) }
end
