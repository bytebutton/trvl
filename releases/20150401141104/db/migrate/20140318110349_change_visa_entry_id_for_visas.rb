class ChangeVisaEntryIdForVisas < Migration::ClearMigration
  def up
    change_column_null(:visas, :visa_entry_id, true)
  end

  def down
    Visa.where(:visa_entry_id => nil).update_all(:visa_entry_id => VisaEntry.first)
    change_column_null(:visas, :visa_entry_id, false)
  end
end
