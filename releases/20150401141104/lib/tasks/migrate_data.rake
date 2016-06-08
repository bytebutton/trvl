namespace :migrate_data do

  desc 'Add ISO Codes'
  task :country_iso => :environment do
    puts "====== add country iso ======"
    file_json_path =  Rails.root.join('public','countries.json').to_path

    countries_json = File.read(file_json_path)
    # change code for Macedonia and Greek
    macedonia = Country.where({:code => '(5'}).first
    macedonia.update_attribute(:code, 'mk') if macedonia.present?
    greece = Country.where({:code =>'el'}).first
    greece.update_attribute(:code, 'gr') if greece.present?

    # set iso codes
    JSON.parse(countries_json).each do |country|
      country_record = Country.where({:code => country['cca2'].downcase}).first
      if country_record.present?
        country_record.cca3 = country['cca3']
        country_record.cca2 = country['cca2']
        puts country_record.save
      end
    end
  end

  desc 'Migrate Gender Statuses'
  task :gender_statuses => :environment do
    User::Profile.find_each { |profile| profile.update_attribute(:gender_status, profile.gender) if profile.gender.present? }
  end


  desc 'Migrate Wizard Statuses'
  task :wizard_statuses => :environment do
    User.find_each { |user| user.update_attribute(:wizard_status, user.step) if user.step.present? }
  end

end