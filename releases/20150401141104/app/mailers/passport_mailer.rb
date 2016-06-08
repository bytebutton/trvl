class PassportMailer < BaseMailer

  #ready + checked
  def passport_expires(passport)
    @passport = passport
    mail(:to => passport.user.email, :subject => 'Expiring Passport')
  end

  #ready + checked
  def passport_expires_plg(passport)
    @passport = passport
    mail(:subject => 'Client Expire Passport')
  end

  #ready + checked
  def user_create_passport(passport)
    @passport = passport
    @user     = passport.user
    mail(:subject => 'New Passport Assistance Needed')
  end

  ##ready + checked
  #def passport_assistance(passport)
  #  @passport = passport
  #  @user     = passport.user
  #  mail(:subject => 'Passport Assistance Needed')
  #end

end
