class Trip < Base::VersionModel

  attr_accessor :with_api_request

  belongs_to :user
  belongs_to :purpose
  belongs_to :to,              :class_name => 'Country'
  belongs_to :from,            :class_name => 'Country'
  belongs_to :transit_country, :class_name => 'Country'
  belongs_to :state
  belongs_to :visa
  has_one    :passport_request, :dependent => :nullify

  scope :current_by_time,  -> { where("date_from <= ? AND date_to >= ? AND is_current = ?", Date.current, Date.current, false) }
  scope :current,  -> { where({:is_current => true}) }
  scope :upcoming, -> { where("date_from > ?", Date.current) }
  scope :previous, -> { where("date_to < ?", Date.current) }
  scope :order_by_date_asc, -> { order('date_from ASC') }
  scope :order_by_date_desc, -> { order('date_from DESC') }

  accepts_nested_attributes_for :passport_request, :reject_if => :all_blank

  before_create :determine_visa_for_trip
  after_create  :send_visa_assistance_mail
  after_save    :determine_current_trip

  validates :date_from,
            :date_to,
            :purpose_id,
            :from_id,
            :to_id,
            :presence => true

  validate :check_primary_passport
  validate :check_date_from
  validate :check_date_to
  validate :validate_available_dates

  class << self
    def in_dates(date_start, date_end, trip_id)
      query = where('(date_from <= ? AND date_to >= ?) OR (date_from <= ? AND date_to >= ?)', date_start.to_date, date_start.to_date, date_end.to_date, date_end.to_date)
      query = query.where.not(:id => trip_id) if trip_id
      query.first
    end

    def save_with_timatic_response(timatic)
      @trip.visa_required     = timatic[:visa_required]
      @trip.passport_required = timatic[:passport_required]
      @trip.save
    end
  end

  def days_busy
    "These days they are busy in another trip for place: #{to.name} (#{I18n.l(date_from)} - #{I18n.l(date_to)})"
  end

  def duration_of_stay
    (date_to.to_date.mjd - date_from.to_date.mjd) || 0
  end

  def dates_range
    "#{I18n.l(date_from)} - #{I18n.l(date_to)}"
  end

  def current?
    is_current
  end

  def with_api_request?
    with_api_request == 'true'
  end

  def home_country?
    user.passport.country == to
  end

  # validate_available_dates not private function
  def validate_available_dates
    trip = self.user.trips.in_dates(self.date_from, self.date_to, self.id)
    errors.add(:base, trip.days_busy) if trip
  end

  def set_as_current
    update_attributes({:is_current => true})
  end

  private

    def determine_visa_for_trip
      if home_country?
        self.visa_required = false
      else
        visas = self.user.visas.available_visas(to_id, purpose_id, date_from, date_to)

        res   = nil
        visas.each do |visa|
          res = visa.free_entries
          break if res
        end
        self.visa = res
      end
    end

    def check_primary_passport
      errors.add(:base, "You cannot create a trip or leave country without a primary passport. Please enter passport information below or request assistance from #{SITE_BRAND}.") unless self.user.andand.has_passport?
    end

    def check_date_from
      errors.add(:date_from, "Date of Entry can't be more then Date of Departure or less then Visa Issue Date") if self.date_from > self.date_to
    end

    def check_date_to
      errors.add(:date_to, "Date of Departure can't be less then Date of Entry or more then Visa Expiry Date") if self.date_to < self.date_from
    end

    def send_visa_assistance_mail
      TripMailer.delay.visa_assistance(self) if visa.nil? && visa_required?
    end

    def determine_current_trip
      self.user.trips.where.not({:id => id}).update_all({:is_current => false}) if is_current_changed? && current?
    end

end
