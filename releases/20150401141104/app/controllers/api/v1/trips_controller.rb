class Api::V1::TripsController < LoggedUserController

  def available_dates
    trip = current_user.trips.in_dates(params[:date_from], params[:date_to], params[:trip_id])
    render :text => (trip ? trip.days_busy : false)
  end

end
