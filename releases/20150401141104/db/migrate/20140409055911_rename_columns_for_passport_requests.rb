class RenameColumnsForPassportRequests < Migration::ClearMigration
  def up
    rename_column :passport_requests, :is_free_pages, :have_blank_pages
    rename_column :passport_requests, :is_damaged, :is_intact
  end

  def down
    rename_column :passport_requests, :have_blank_pages, :is_free_pages
    rename_column :passport_requests, :is_intact, :is_damaged
  end
end
