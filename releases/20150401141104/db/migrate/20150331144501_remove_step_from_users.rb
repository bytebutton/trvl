class RemoveStepFromUsers < Migration::ClearMigration

  def change
    remove_column :users, :step
  end

end
