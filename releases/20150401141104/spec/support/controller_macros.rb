module ControllerMacros
  def login_manager
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:manager]
      @manager = FactoryGirl.create(:manager)
      User.current_user = @manager
      sign_in @manager # Using factory girl as an example
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = FactoryGirl.create(:user)
      #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
      User.current_user = @user
      sign_in @user
    end
  end
end