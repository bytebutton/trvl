class FixColumns < Migration::ClearMigration

  def change

    add_column :user_profiles, :has_more_nationality, :boolean, :null => false, :default => false
    rename_column :passport_requests, :text_request, :text
    rename_column :passport_requests, :have_free_pages, :is_free_pages
    rename_column :passport_requests, :status, :is_processed
    change_column :passport_requests, :is_processed, :boolean

    # remove not needed columns
    remove_column :companies, :alias
    remove_column :settings, :description
    remove_column :visas, :duration

    # Fix Purposes Table
    remove_foreign_key(:visas, :name => 'visa_types_fk')
    rename_table :trip_purposes, :purposes
    rename_column :trips, :trip_purpose_id, :purpose_id
    rename_column :visas, :visa_type_id, :purpose_id


    #Fix Old Settings
    drop_table :visa_types
    drop_table :timatic_configs

    # Fix Old User Passports
    remove_foreign_key(:user_passports, :name => 'user_passports_fk')
    drop_table :user_passports
    rename_table :user_passport_types, :passport_types


    #fix cron tables
    CronPassport.find_each { |cp| cp.destroy! unless cp.passport }
    execute 'ALTER TABLE cron_visas MODIFY id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT  ;'
    add_foreign_key(:cron_passports, :passports)


    remove_foreign_key(:cron_visas, :name => 'cron_visa_fk')
    add_foreign_key(:cron_visas, :visas)

    #change STATES Table
    rename_table :usa_states, :states
    add_column :states, :country_id, :integer
    execute 'ALTER TABLE states MODIFY country_id INT(11) UNSIGNED;'
    add_foreign_key(:states, :countries)
    State.reset_column_information
    State.find_each { |s| s.update_attributes!({ :country => Country.find_by({:code => 'US'}) }) }

    #companies_managers KEYS
    remove_foreign_key(:companies_managers, :name => 'managers_companies_fk')
    remove_foreign_key(:companies_managers, :name => 'managers_companies_fk1')
    add_foreign_key(:companies_managers, :users, :column => 'manager_id')
    add_foreign_key(:companies_managers, :companies)
    add_timestamps(:companies_managers)
    execute 'ALTER TABLE companies_managers MODIFY id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT;'

    #managers_companies KEYS
    remove_foreign_key(:companies_users, :name => 'companies_users_ibfk_1')
    remove_foreign_key(:companies_users, :name => 'companies_users_ibfk_2')
    add_foreign_key(:companies_users, :users)
    add_foreign_key(:companies_users, :companies)
    add_timestamps(:companies_users)
    execute 'ALTER TABLE companies_users MODIFY id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT;'

    #passport_requests KEYS
    PassportRequest.find_each do |pr|
      pr.destroy! unless pr.user
    end
    add_column :passport_requests, :trip_id, :integer
    add_column :passport_requests, :is_assistance, :boolean, :null => false, :default => false
    execute 'ALTER TABLE passport_requests MODIFY id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT;'
    execute 'ALTER TABLE passport_requests MODIFY user_id INT(11) UNSIGNED;'
    execute 'ALTER TABLE passport_requests MODIFY trip_id INT(11) UNSIGNED;'
    add_foreign_key(:passport_requests, :users)
    add_foreign_key(:passport_requests, :trips)

    #request_callbacks KEYS
    rename_column :request_callbacks, :status, :is_processed
    execute 'ALTER TABLE request_callbacks MODIFY id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT;'
    execute 'ALTER TABLE request_callbacks MODIFY user_id INT(11) UNSIGNED NOT NULL;'
    # add_foreign_key(:request_callbacks, :users)

    #secure_messages KEYS
    execute 'ALTER TABLE secure_messages MODIFY id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT;'
    execute 'ALTER TABLE secure_messages MODIFY user_id INT(11) UNSIGNED NOT NULL;'
    add_foreign_key(:secure_messages, :users)

    #passports KEYS
    execute 'ALTER TABLE passports MODIFY user_id INT(11) UNSIGNED;'
    execute 'ALTER TABLE passports MODIFY passport_type_id INT(11) UNSIGNED;'
    execute 'ALTER TABLE passports MODIFY country_id INT(11) UNSIGNED;'
    add_foreign_key(:passports, :users)
    add_foreign_key(:passports, :passport_types)
    add_foreign_key(:passports, :countries)

    #trips KEYS
    remove_columns(:trips, :duration_of_stay)

    remove_foreign_key(:trips, :name => 'trips_fk')
    remove_foreign_key(:trips, :name => 'trips_fk1')
    add_foreign_key(:trips, :users)
    add_foreign_key(:trips, :visas)
    add_foreign_key(:trips, :countries, :column => 'to_id')
    add_foreign_key(:trips, :countries, :column => 'from_id')
    add_foreign_key(:trips, :purposes)
    add_foreign_key(:trips, :states)

    #visas KEYS
    remove_foreign_key(:visas, :name => 'users_fk')
    add_foreign_key(:visas, :users)
    add_foreign_key(:visas, :users, :column => 'verified_admin_id')
    add_foreign_key(:visas, :countries)
    add_foreign_key(:visas, :purposes)
    add_foreign_key(:visas, :visa_entries)

    #user_profiles KEYS
    remove_columns(:user_profiles, :plg_customer, :emergency_contact)

    rename_column :user_profiles, :usa_state_id, :state_id
    rename_column :user_profiles, :home_usa_state_id, :home_state_id
    rename_column :user_profiles, :phone_mobile, :mobile_phone_number
    change_column :user_profiles, :dob, :datetime

    remove_foreign_key(:user_profiles, :name => 'user_profiles_ibfk_1')
    add_foreign_key(:user_profiles, :users)
    add_foreign_key(:user_profiles, :countries)

    User::Profile.reset_column_information
    User::Profile.find_each do |up|
      up.nationality_id = nil unless up.nationality
      up.second_nationality_id = nil unless up.second_nationality
      up.third_nationality_id = nil unless up.third_nationality
      up.address_country_id = nil unless up.address_country
      up.home_country_id = nil unless up.home_country
      up.home_state_id = nil unless up.home_state
      up.save({:validate => false})
    end

    execute 'ALTER TABLE user_profiles MODIFY country_id INT(11) UNSIGNED NULL DEFAULT NULL;'
    execute 'ALTER TABLE user_profiles MODIFY nationality_id INT(11) UNSIGNED;'
    execute 'ALTER TABLE user_profiles MODIFY second_nationality_id INT(11) UNSIGNED;'
    execute 'ALTER TABLE user_profiles MODIFY third_nationality_id INT(11) UNSIGNED;'
    execute 'ALTER TABLE user_profiles MODIFY address_country_id INT(11) UNSIGNED;'
    execute 'ALTER TABLE user_profiles MODIFY home_country_id INT(11) UNSIGNED;'
    execute 'ALTER TABLE user_profiles MODIFY home_state_id INT(11) UNSIGNED;'

    add_foreign_key(:user_profiles, :countries, :column => 'nationality_id')
    add_foreign_key(:user_profiles, :countries, :column => 'second_nationality_id')
    add_foreign_key(:user_profiles, :countries, :column => 'third_nationality_id')
    add_foreign_key(:user_profiles, :countries, :column => 'address_country_id')
    add_foreign_key(:user_profiles, :countries, :column => 'home_country_id')
    add_foreign_key(:user_profiles, :states,    :column => 'home_state_id')
    add_foreign_key(:user_profiles, :states)


  end

end
