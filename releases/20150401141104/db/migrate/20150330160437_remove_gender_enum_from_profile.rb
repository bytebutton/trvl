class RemoveGenderEnumFromProfile < Migration::ClearMigration

  def change
    remove_column :user_profiles, :gender
  end

end
