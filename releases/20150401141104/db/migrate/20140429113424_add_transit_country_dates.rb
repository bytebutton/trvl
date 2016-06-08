class AddTransitCountryDates < Migration::ClearMigration
  def up
    add_column :trips, :transit_arrival_date, :date
    add_column :trips, :transit_departure_date, :date
  end

  def down
    remove_column :trips, :transit_departure_date
    remove_column :trips, :transit_arrival_date
  end
end
