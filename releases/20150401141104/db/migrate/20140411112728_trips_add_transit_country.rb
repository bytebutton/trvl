class TripsAddTransitCountry < Migration::ClearMigration
  def up
    add_reference :trips, :transit_country, :index => true, :unsigned => true
    add_foreign_key :trips, :countries, :column => :transit_country_id, :name => 'trip_country_transit_country_fk'
  end

  def down
    remove_foreign_key(:trips, :name => 'trip_country_transit_country_fk')
    remove_reference :trips, :transit_country
  end
end
