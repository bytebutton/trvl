class SecureMessagesController < LoggedUserController

  def create
    create! { contact_path }
  end

end
