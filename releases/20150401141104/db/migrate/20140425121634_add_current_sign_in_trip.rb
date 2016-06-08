class AddCurrentSignInTrip < Migration::ClearMigration
  def change
    add_column :trips, :is_current, :boolean, { :default => false, :null => false }
  end
end
