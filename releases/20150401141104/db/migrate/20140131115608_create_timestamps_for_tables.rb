class CreateTimestampsForTables < Migration::ClearMigration

  VERSIONS_TABLES = [
      :companies,
      :cron_passports,
      :cron_visas,
      #:companies_managers,
      :passport_requests,
      :settings,
      :timatic_configs,
      :trips,
      :user_callbacks,
      :user_passports,
      :user_profiles,
      :users,
      #:companies_users,
      :visas
  ]

  def up
    add_column :companies_managers, :id, :primary_key
    add_column :companies_users,    :id, :primary_key
    add_column :trips, :is_current_changed, :boolean, :null => false, :default => false
    remove_column :settings, :type

    VERSIONS_TABLES.map { |vt|
      add_timestamps(vt)

      if [:user_passports, :user_profiles].include?(vt)
        model = User::Profile  if vt == :user_profiles
      else
        model = vt.to_s.classify.constantize
      end
      model.reset_column_information
      if vt == :user_callbacks
        model.all.each { |record|
          record.attributes = {:created_at => record.create_at, :updated_at => record.create_at}
          record.save!({:validate => false})
        }
      else
        model.all.each { |record|
          record.attributes = {:created_at => Time.zone.now, :updated_at => Time.zone.now}
          record.save!({:validate => false})
        }
      end
    }
  end

  def down
    remove_column :companies_managers, :id
    remove_column :companies_users,    :id
    add_column :settings, :type, :string, :limit => 100

    VERSIONS_TABLES.map { |vt| remove_timestamps(vt) }
  end

end
