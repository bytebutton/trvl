class Country < Base::SeedModel

  has_many :states,                            :class_name => 'State',         :dependent => :nullify
  has_many :passports,                         :class_name => 'Passport',      :dependent => :nullify
  has_many :user_profiles,                     :class_name => 'User::Profile', :dependent => :nullify, :foreign_key => :country_id
  has_many :user_profile_address_countries,    :class_name => 'User::Profile', :dependent => :nullify, :foreign_key => :address_country_id
  has_many :user_profile_home_countries,       :class_name => 'User::Profile', :dependent => :nullify, :foreign_key => :home_country_id
  has_many :user_profile_nationalities,        :class_name => 'User::Profile', :dependent => :nullify, :foreign_key => :nationality_id
  has_many :user_profile_second_nationalities, :class_name => 'User::Profile', :dependent => :nullify, :foreign_key => :second_nationality_id
  has_many :user_profile_third_nationalities,  :class_name => 'User::Profile', :dependent => :nullify, :foreign_key => :third_nationality_id
  has_many :depart_trips,                      :class_name => 'Trip',          :dependent => :destroy, :foreign_key => :to_id
  has_many :travel_trips,                      :class_name => 'Trip',          :dependent => :destroy, :foreign_key => :from_id
  has_many :visas,                             :class_name => 'Visa',          :dependent => :destroy, :foreign_key => :country_id

  scope :popular_depart_countries, -> (limit = 5) { popular_countries_by_direction('from_id', limit) }
  scope :popular_travel_countries, -> (limit = 5) { popular_countries_by_direction('to_id', limit)   }

  def self.popular_countries_by_direction(direction, limit = 5)
    find_by_sql "(
        SELECT countries.*, COUNT(trips.id) AS population
        FROM countries
        LEFT JOIN trips ON (countries.id = trips.#{direction})
        GROUP BY countries.id
        HAVING population > 0
        ORDER BY population DESC
        LIMIT #{limit}
      ) UNION (
        SELECT countries.*, 0 AS population
        FROM countries
        ORDER BY countries.name ASC )"
  end

end
