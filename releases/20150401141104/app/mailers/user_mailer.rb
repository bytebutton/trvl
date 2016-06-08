class UserMailer < BaseMailer

  #ready + checked
  def welcome(user, password_for_email)
    @user = user
    @password_for_email = password_for_email
    puts({:to => @user.email, :subject => "Welcome to #{SITE_BRAND}"})
    mail({:to => @user.email, :subject => "Welcome to #{SITE_BRAND}"})
  end


  #ready + checked
  def passport_assistance(passport_request)
    @passport_request = passport_request
    @passport = passport_request.user.passport
    @user     = passport_request.user
    mail(:subject => 'Passport Assistance Needed')
  end

end
