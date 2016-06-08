class AddGenderStatusInProfile < Migration::ClearMigration

  def change

    add_column :user_profiles, :gender_status, :integer, :null => false, :default => 0

  end

end
