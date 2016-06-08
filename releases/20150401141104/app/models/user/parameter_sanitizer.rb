class User::ParameterSanitizer < Devise::ParameterSanitizer

  def account_update
    default_params.permit(:password, :password_confirmation, :current_password)
  end

end
