class RemoveImagesFromProfile < Migration::ClearMigration

  def up
    remove_columns :user_profiles, :avatar, :vaccination_certificate
  end

  def down
    add_column :user_profiles, :avatar,  :string
    add_column :user_profiles, :vaccination_certificate,  :string
  end

end
