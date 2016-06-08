class RemoveFioColumnsFromProfile < Migration::ClearMigration

  def up
    # remove_columns :user_profiles, :first_name, :last_name, :middle_name
  end

  def down
    # add_column :user_profiles, :first_name,  :string
    # add_column :user_profiles, :last_name,   :string
    # add_column :user_profiles, :middle_name, :string
  end

end
