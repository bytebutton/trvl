require "spec_helper"

describe BootstrapFlashHelper do
  describe "#bootstrap_flash" do

    it "return default flash" do
      helper.bootstrap_flash().should have_selector('div.flash-messages')
    end

  end
end