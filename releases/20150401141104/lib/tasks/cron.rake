namespace :cron do

  desc 'Visas Expires Cron Task'
  task :visa_expires => :environment do
    time_now = Date.today
    range    = time_now..(time_now + 3.months)

    def visa_notify(visa, time_now)
      VisaMailer.delay.visa_expires(visa)
      VisaMailer.delay.visa_expires_plg(visa)
      CronVisa.find_or_create_by({:visa => visa}).update_attributes({:send_at => time_now})
    end

    Visa.where({:expires_on => range}).find_each do |visa|
      visa_notify(visa, time_now) if (!visa.cron_visa.present?) ||
          (((visa.expires_on - 2.months) >= time_now) & ((visa.cron_visa.send_at.to_date + 2.months) <= time_now)) ||
            (((visa.expires_on - 1.months) >= time_now) & ((visa.cron_visa.send_at.to_date + 1.months) <= time_now))
    end

  end

  desc 'Passports Expires Cron Task'
  task :passport_expires => :environment do

    time_now = Date.today
    range    = time_now..(time_now + 3.months)

    def passport_notify(passport, time_now)
      PassportMailer.delay.passport_expires(passport)
      PassportMailer.delay.passport_expires_plg(passport)
      CronPassport.find_or_create_by({:passport => passport}).update_attributes({:send_at => time_now})
    end

    Passport.where({:expires_on => range}).find_each do |passport|
      passport_notify(passport, time_now) if (!passport.cron_passport.present?) ||
          (((passport.expires_on - 2.months) >= time_now) & ((passport.cron_passport.send_at.to_date + 2.months) <= time_now)) ||
            (((passport.expires_on - 1.month) >= time_now) & ((passport.cron_passport.send_at.to_date + 1.month) <= time_now))
    end

  end

end