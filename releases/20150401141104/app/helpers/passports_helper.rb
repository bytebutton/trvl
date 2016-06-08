module PassportsHelper

  def primary_status(passport)
    passport.primary? ? 'Yes' : 'No'
  end

  def passport_request_status(passport)
    passport.user.has_passport_request? ? 'Yes' : 'No'
  end

end
