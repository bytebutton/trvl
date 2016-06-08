class UsersController < LoggedUserController

  def create
    create! { edit_user_path(@user) }
  end

  def update
    update! { edit_user_path(@user) }
  end

end
