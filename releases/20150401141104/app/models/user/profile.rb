class User::Profile < Base::VersionModel

  enum :gender_status => { :male => 0, :female => 1 }

  belongs_to :user
  belongs_to :country
  belongs_to :nationality,        :class_name => 'Country'
  belongs_to :second_nationality, :class_name => 'Country'
  belongs_to :third_nationality,  :class_name => 'Country'
  belongs_to :home_state,         :class_name => 'State'
  belongs_to :home_country,       :class_name => 'Country'
  belongs_to :state
  belongs_to :address_country,    :class_name => 'Country'

  validates :mobile_phone_number,
            :presence => true,
            :if => :first_or_last_step?

  validates :home_address_line_1,
            :home_city,
            :home_postal_code,
            :home_country,
            :presence => true, :if => :second_or_last_step?

  private

    def active_user?
      user.andand.active?
    end

    def first_or_last_step?
      user.andand.step1?  || user.andand.step3? || active_user?
    end

    def second_or_last_step?
      user.andand.step2? || user.andand.step3? || active_user?
    end

end
