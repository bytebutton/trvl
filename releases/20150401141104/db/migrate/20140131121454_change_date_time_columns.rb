class ChangeDateTimeColumns < Migration::ClearMigration

  def up

    #===========CRONS===============#
    CronPassport.find_each { |r| r.update_attribute(:updated_at, Time.at(r.date_send.to_i).utc.to_datetime) }
    CronVisa.find_each     { |r| r.update_attribute(:updated_at, Time.at(r.date_send.to_i).utc.to_datetime) }
    remove_column :cron_passports, :date_send
    remove_column :cron_visas,     :date_send

    puts 'CRONS MIGRATION READY'

    #===========TRIPS===============#
    add_column :trips, :date_from_temp, :date
    add_column :trips, :date_to_temp,   :date

    Trip.reset_column_information
    Trip.find_each do |trip|
      trip.attributes = {:date_from_temp => Time.at(trip.date_from.to_i).utc.to_date,:date_to_temp => Time.at(trip.date_to.to_i).utc.to_date}
      trip.save!({:validate => false})
    end

    remove_columns :trips, :date_from, :date_to
    add_column :trips, :date_from, :date
    add_column :trips, :date_to,   :date

    Trip.reset_column_information
    Trip.find_each do |trip|
      trip.attributes = {:date_from => trip.date_from_temp, :date_to => trip.date_to_temp}
      trip.save!({:validate => false})
    end

    remove_columns :trips, :date_from_temp, :date_to_temp
    Trip.reset_column_information
    puts 'TRIPS MIGRATION READY'


    #===========USER PASSPORTS===============#

    add_column :user_passports, :valid_from, :date
    add_column :user_passports, :expires_on, :date
    remove_columns :user_passports, :issue_date, :expiry_date
    puts 'USER PASSPORTS MIGRATION READY'


    #===========VISAS===============#

    add_column :visas, :valid_from, :date
    add_column :visas, :expires_on, :date
    add_column :visas, :verified_date_temp, :date
    Visa.reset_column_information
    Visa.find_each do |visa|
      visa.attributes = {
          :valid_from => Time.at(visa.issue_date.to_i).utc.to_date,
          :expires_on => Time.at(visa.exp_date.to_i).utc.to_date,
          :verified_date_temp => Time.at(visa.verified_date.to_i).utc.to_date
      }
      visa.save!({:validate => false})
    end

    remove_columns :visas, :issue_date, :exp_date, :verified_date
    add_column :visas, :verified_date, :date
    Visa.reset_column_information

    Visa.find_each do |visa|
      visa.attributes = { :verified_date => visa.verified_date_temp }
      visa.save!({:validate => false})
    end

    remove_columns :visas, :verified_date_temp
    Visa.reset_column_information

    puts 'VISAS MIGRATION READY'

  end



  def down

    #===========VISAS===============#
    add_column :visas, :issue_date, :string, :limit => 100
    add_column :visas, :exp_date, :string,   :limit => 100
    Visa.reset_column_information
    Visa.find_each do |visa|
      visa.update_attributes!({:issue_date => visa.valid_from.to_i, :exp_date => visa.expires_on.to_i})
    end
    remove_columns :visas, :valid_from, :expires_on
    puts 'VISAS ROLLBACK READY'


    #===========USER PASSPORTS===============#
    add_column :user_passports, :issue_date,  :string, :limit => 100
    add_column :user_passports, :expiry_date, :string, :limit => 100
    remove_columns :user_passports, :valid_from, :expires_on
    puts 'USER PASSPORTS ROLLBACK READY'

    #===========TRIPS===============#
    add_column :trips, :date_from_temp,  :string, :limit => 100
    add_column :trips, :date_to_temp,    :string, :limit => 100
    Trip.reset_column_information
    Trip.find_each do |trip|
      trip.update_attributes!({:date_from_temp => trip.date_from.to_i, :date_to_temp => trip.date_to.to_i})
    end
    remove_columns :trips, :date_from, :date_to

    add_column :trips, :date_from,  :string, :limit => 100
    add_column :trips, :date_to,    :string, :limit => 100

    Trip.reset_column_information
    Trip.find_each do |trip|
      trip.update_attributes!({:date_from => trip.date_from_temp, :date_to => trip.date_to_temp})
    end

    remove_columns :trips, :date_from_temp, :date_to_temp

    puts 'TRIPS MIGRATION READY'

    #===========CRONS===============#
    add_column :cron_passports, :date_send,  :string, :limit => 100
    add_column :cron_visas,     :date_send,  :string, :limit => 100
    CronPassport.reset_column_information
    CronVisa.reset_column_information
    CronPassport.find_each { |cp| cp.update_attributes!({:date_send => cp.updated_at.to_i}) }
    CronVisa.find_each     { |cv| cv.update_attributes!({:date_send => cv.updated_at.to_i}) }
    puts 'CRON TABLES ROLLBACK READY'

  end

end
