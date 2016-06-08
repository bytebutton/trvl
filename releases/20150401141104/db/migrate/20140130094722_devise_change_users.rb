class DeviseChangeUsers < Migration::ClearMigration
  def up
    change_table(:users) do |t|
      ## Database authenticatable
      #t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0, :null => false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      #t.string   :confirmation_token
      #t.datetime :confirmed_at
      #t.datetime :confirmation_sent_at
      #t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.string  :type,     :null => false, :default => 'User'
      t.boolean :is_admin, :null => false, :default => false
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true

    #rename linked tables
    rename_table :managers_companies, :companies_managers
    rename_table :users_companies,    :companies_users
    rename_column :companies_managers, :user_id, :manager_id

    remove_foreign_key(:roles_users, :name => 'roles_users_ibfk_1')
    remove_foreign_key(:roles_users, :name => 'roles_users_ibfk_2')
    drop_table :roles
    drop_table :roles_users
    drop_table :user_tokens

    add_column    :user_profiles, :vaccination_certificate, :string

    change_column :users, :step, :string, :limit => 50, :default => 'change_password'
    rename_column :users, :agreed, :is_agreed_terms
    remove_columns :users, :last_login, :logins, :password, :isNew

  end


  def down
    remove_index :users, :email
    remove_index :users, :reset_password_token
    remove_columns :users,
                   :encrypted_password,
                   :reset_password_token,
                   :reset_password_sent_at,
                   :remember_created_at,
                   :sign_in_count,
                   :current_sign_in_at,
                   :current_sign_in_ip,
                   :last_sign_in_at,
                   :last_sign_in_ip,
                   :is_admin
  end

end
