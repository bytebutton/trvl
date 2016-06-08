module PermitsConcern
  extend ActiveSupport::Concern

  included do

    private

    def permitted_params
      {
          :passport_request => params.fetch(:passport_request, {}).permit(
                     :id,
                     :user_id,
                     :is_assistance,
                     :have_blank_pages,
                     :is_intact,
                     :text),

          :passport => params.fetch(:passport, {}).permit(
               :country_id,
               :passport_type_id,
               :number, :valid_from,
               :expires_on,
               :is_primary,
               :passport_bio_cache
           ),

          :request_callback => params.fetch(:request_callback, {}).permit(:phone),

          :secure_message => params.fetch(:secure_message, {}).permit(:text),

          :trip => params.fetch(:trip, {}).permit(
               :from_id,
               :to_id,
               :state_id,
               :province,
               :transit_country_id,
               :purpose_id,
               :date_from,
               :date_to,
               :is_current,
               :airport,
               :with_api_request,
               :transit_arrival_date,
               :transit_departure_date,
               :passport_request_attributes => [
                   :id,
                   :user_id,
                   :is_assistance,
                   :have_blank_pages,
                   :is_intact,
                   :text
               ]
          ),
            :visa => params.fetch(:visa, {}).permit(
                 :country_id,
                 :purpose_id,
                 :visa_entry_id,
                 :number,
                 :valid_from,
                 :expires_on,
                 :scan_cache),

            :user => params.fetch(:user, {}).permit(
                :email,
                :first_name,
                :middle_name,
                :last_name,
                :password,
                :password_confirmation,
                :current_password,
                :avatar_cache,
                :remove_avatar,
                :vaccination_certificate_cache,
                :remove_vaccination_certificate,
                { :company_ids => [] },
                :is_agreed_terms,
                {
                    :profile_attributes => [
                      :id,
                      :company,
                      :gender_status,
                      :dob,
                      :country_id,
                      :nationality_id,
                      :has_more_nationality,
                      :second_nationality_id,
                      :third_nationality_id,
                      :mobile_phone_number,
                      :secondary_email,
                      :home_address_line_1,
                      :home_address_line_2,
                      :home_city,
                      :home_state_id,
                      :home_address_province,
                      :home_postal_code,
                      :home_country_id,
                      :job_title,
                      :hr_manager,
                      :hr_manager_email,
                      :work_address_line_1,
                      :work_address_line_2,
                      :address_city,
                      :state_id,
                      :address_province,
                      :postal_code,
                      :address_country_id
                    ]
                }
            )
      }
    end

  end

end