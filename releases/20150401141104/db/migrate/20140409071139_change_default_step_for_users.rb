class ChangeDefaultStepForUsers < Migration::ClearMigration
  def up
    change_column :users, :step, :string, :limit => 50, :default => 'license'
  end

  def down
    change_column :users, :step, :string, :limit => 50, :default => 'change_password'
  end
end
