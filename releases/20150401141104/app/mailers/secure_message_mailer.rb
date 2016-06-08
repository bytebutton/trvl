class SecureMessageMailer < BaseMailer

  #ready + checked
  def secure_message(message)
    @message = message
    mail(:subject => 'Secure Message')
  end

end
