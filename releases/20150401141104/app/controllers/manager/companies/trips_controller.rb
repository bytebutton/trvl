class Manager::Companies::TripsController < LoggedUserController
  load_and_authorize_resource :trip, :through => :company

  belongs_to :company

  # GET /manager/companies/users.json
  def index
    respond_with(@trips) do |format|
      format.json { render({:json => TripsDataTable.new(view_context)}) }
    end
  end

end
