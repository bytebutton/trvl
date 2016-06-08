class TripsDataTable < AbstractDataTable
  delegate :arrival_destination_places, :visa_status, :to => :@view

  private
    def data
      records.map do |trip|
        [
            trip.user.companies_list,
            trip.user.full_name,
            trip.user_id,
            trip.user.profile.andand.nationality.andand.nationality,
            arrival_destination_places(trip),
            trip.dates_range,
            visa_status(trip),
            trip.purpose.name
        ]
      end
    end

    def records
      paginate(@view.assigns['trips'])
    end

end