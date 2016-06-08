class CreatePassports < Migration::TableMigration

  def up
    create_table :passports do |t|
      t.references :user,               :null => false
      t.references :passport_type,      :null => false
      t.references :country,            :null => true

      t.string   :number,                :limit => 50
      t.date     :valid_from
      t.date     :expires_on
      t.string   :passport_bio,          :limit => 50
      t.string   :issued_by
      t.boolean  :is_primary

    end
    execute 'ALTER TABLE passports MODIFY id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT;'
    Passport.reset_column_information
  end

  def down
    drop_table :passports
  end

end
