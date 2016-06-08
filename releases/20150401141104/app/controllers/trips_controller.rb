class TripsController < LoggedUserController

  before_action :preload_resources, :only => [:new, :create, :edit, :update]
  before_action :passport_required, :only => [:current, :upcoming, :previous, :deleted]

  include TripsHelper

  # GET /trips/current
  def current
    @trip = @trips.current.first
  end

  # GET /trips/upcoming
  def upcoming
    @trips = @trips.upcoming.order_by_date_asc.page(params[:page])
  end

  # GET /trips/previous
  def previous
    @trips = @trips.previous.order_by_date_desc.page(params[:page])
  end

  # GET /trips/deleted
  def deleted
    @trips =  Kaminari.paginate_array(Trip.destroyed_objects_by_user(current_user)).page(params[:page])
  end

  # GET /trips/new
  def new
    if current_user.has_passport?
      flash[:info]  = 'You are not eligible to travel, your passport is expiring within 12 months or has expired. Please renew your passport.' if current_user.passport.old?
    else
      flash[:error] = "You cannot create a trip or leave the country without a primary passport. Please enter passport information, choose a primary passport or request assistance from #{SITE_BRAND}."
    end
  end

  # POST /trips
  def create
    respond_to do |format|
      format.html do
        if @trip.valid?
          if @trip.with_api_request? && !@trip.home_country?
            save_with_timatic
          else
            @trip.save
            flash[:notice] = @trip.home_country? ? 'Trip has been successfully created. Visa is not required for this trip.' : 'Trip was successfully created.'
            redirect_to(edit_user_path(current_user))
          end
        else
          render({:action => 'new'})
        end
      end
    end
  end

  # PATCH/PUT /trips/1
  def update
    @trip.attributes = permitted_params.fetch(:trip)

    respond_to do  |format|
      format.html do
        if @trip.valid?
          if @trip.home_country?
            @trip.save
            flash[:notice] = 'Visa is not required for this trip. You hold a passport to this country.'
            redirect_to(edit_user_path(current_user))
          else
            save_with_timatic
          end
        else
          render({:action => 'edit'})
        end
      end
    end
  end

  # PATCH/PUT /trips/1/set_current
  def set_as_current
    @trip.set_as_current
    redirect_to(current_trips_path)
  end

  # GET /trips/1/finish
  def finish
    flash.clear
  end

  private

    def save_with_timatic
      timatic_info = TimaticClient.new.trip_info(@trip)
      unless timatic_info.is_a?(TrueClass)
        @timatic                = timatic_parse(timatic_info)
        @trip.visa_required     = @timatic[:visa_required]
        @trip.passport_required = @timatic[:passport_required]
        @trip.save
        @messages = scenarios_message(@trip)
        flash[@messages[:status]] = @messages[:message]
        render('with_api_response')
      else
        flash[:error] = 'Invalid value specified in XML Request'
        render({:action => @trip.new_record? ? 'new' : 'edit' })
      end
    end

    def passport_required
      unless current_user.has_passport?
        flash[:error] = "You cannot create a trip or leave the country without a primary passport. Please enter passport information, choose a primary passport or request assistance from #{SITE_BRAND}."
        redirect_to(:back)
      end
    end

    def preload_resources
      @trip.build_passport_request unless @trip.passport_request
      @visa = Visa.new
    end

end
