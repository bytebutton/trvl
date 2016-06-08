class PassportsDataTable < AbstractDataTable
  delegate :passport_request_status, :to => :@view

  private
    def data
      records.map do |passport|
        [
            passport.user.companies_list,
            passport.user.full_name,
            passport.user_id,
            passport.user.profile.andand.nationality.andand.name,
            passport.number,
            passport.country.name,
            l(passport.valid_from),
            l(passport.expires_on),
            passport_request_status(passport)
        ]
      end
    end

    def records
      paginate(@view.assigns['passports'])
    end

end