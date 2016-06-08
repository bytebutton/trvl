require 'spec_helper'

describe SecureMessage do
  it { should belong_to(:user) }

  # validates
  it { should validate_presence_of(:text) }

end
