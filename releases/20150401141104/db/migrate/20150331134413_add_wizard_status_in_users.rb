class AddWizardStatusInUsers < Migration::ClearMigration

  def change
    add_column :users, :wizard_status, :integer, :null => false, :default => 0
  end

end
