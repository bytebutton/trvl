class AddSendAtInCronTables < Migration::ClearMigration

  def up
    add_column :cron_visas, :send_at, :datetime
    add_column :cron_passports, :send_at, :datetime
    CronVisa.reset_column_information
    CronPassport.reset_column_information
    CronVisa.find_each { |r| r.update_attributes({:send_at => Time.zone.now}) }
    CronPassport.find_each { |r| r.update_attributes({:send_at => Time.zone.now}) }
  end

end
