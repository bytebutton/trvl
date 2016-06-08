class VisaMailer < BaseMailer
  include ViewHelper

  #ready + checked
  def visa_expires(visa)
    @visa = visa
    mail(:to => visa.user.email, :subject => 'Expiring Visa')
  end

  #ready + checked
  def visa_expires_plg(visa)
    @visa = visa
    mail(:subject => 'Client Expire Visa')
  end

  #ready + checked
  def user_create_visa(visa)
    @visa = visa
    @user = visa.user
    mail(:subject => 'Visa Added/Needs Verification')
  end

  #ready + checked
  def admin_create_visa(visa)
    @visa = visa
    @user = visa.user
    mail(:to => visa.user.email, :subject => 'Admin Add Visa')
  end

  #ready + checked
  def visa_was_verified(visa)
    @visa = visa
    mail(:to => visa.user.email, :subject => 'Your Visa Has Been Verified')
  end

end
