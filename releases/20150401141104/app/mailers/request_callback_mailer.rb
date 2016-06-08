class RequestCallbackMailer < BaseMailer

  #ready + checked
  def request_callback(callback)
    @callback = callback
    mail(:subject => 'Callback Requested')
  end

end
