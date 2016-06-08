class AddImagesInUser < Migration::ClearMigration

  def up
    add_column :users, :avatar,  :string
    add_column :users, :vaccination_certificate,  :string
  end

  def down
    remove_columns :users, :avatar, :vaccination_certificate
  end

end
