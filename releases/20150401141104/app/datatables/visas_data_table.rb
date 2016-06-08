class VisasDataTable < AbstractDataTable
  delegate :visa_path, :edit_visa_path, :visa_status_text, :to => :@view

  private
    def data
      records.map do |visa|
        [
            visa.user.companies_list,
            visa.user.full_name,
            visa.user_id,
            visa.number,
            visa.user.profile.andand.nationality.andand.nationality,
            visa.country.name,
            l(visa.valid_from),
            l(visa.expires_on),
            visa.purpose.name,
            visa.visa_entry.name,
            visa_status_text(visa)
        ]
      end
    end

    def records
      paginate(@view.assigns['visas'])
    end

end