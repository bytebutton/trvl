require 'spec_helper'

describe RequestCallback do
  it { should belong_to(:user) }

  ##validates
  it { should validate_presence_of(:phone) }

end
