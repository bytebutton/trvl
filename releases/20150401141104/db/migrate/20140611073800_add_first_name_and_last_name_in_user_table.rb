class AddFirstNameAndLastNameInUserTable < Migration::ClearMigration

  def up
    add_column :users, :first_name,  :string
    add_column :users, :last_name,   :string
    add_column :users, :middle_name, :string

    User.reset_column_information
    Manager.reset_column_information
    User.find_each { |u|
      u.inspect
      u.update_attributes({ :first_name => u.profile.andand.first_name, :middle_name => u.profile.andand.middle_name, :last_name => u.profile.andand.last_name })
    }
    Manager.find_each { |u|
      u.inspect
      u.update_attributes({ :first_name => u.profile.andand.first_name, :middle_name => u.profile.andand.middle_name, :last_name => u.profile.andand.last_name })
    }

    remove_columns :user_profiles, :first_name, :last_name, :middle_name

  end

  def down
    remove_columns :users, :first_name, :last_name, :middle_name

    add_column :user_profiles, :first_name,  :string
    add_column :user_profiles, :last_name,   :string
    add_column :user_profiles, :middle_name, :string
  end


end
