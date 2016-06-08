class ChangeCountryCode < Migration::ClearMigration
  def up
    #change_column :countries, :code, :string, :limit => 3
    add_column :countries,    :cca3, :string, :limit => 3
    add_column :countries,    :cca2, :string, :limit => 2
  end

  def down
    #Country.all.each { |c| c.update_attribute(:code, c.cca2.downcase) }
    #change_column :countries, :code, :string, :limit => 2
    remove_column :countries, :cca3
    remove_column :countries, :cca2
  end
end