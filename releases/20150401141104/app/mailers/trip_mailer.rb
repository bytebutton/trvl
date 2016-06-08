class TripMailer < BaseMailer

  #ready + checked
  def visa_assistance(trip)
    @trip = trip
    @user = trip.user
    mail(:subject => 'Visa Assistance Needed')
  end

end
