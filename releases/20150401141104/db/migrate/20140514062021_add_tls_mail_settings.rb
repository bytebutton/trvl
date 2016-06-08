class AddTlsMailSettings < Migration::ClearMigration

  def up

    Setting.by_key(:https).andand.destroy
    Setting.by_key(:smtp_client).update_attributes({:key => 'smtp_settings_address'})
    Setting.by_key(:port).update_attributes({:key => 'smtp_settings_port'})
    Setting.by_key(:smtp_mail_account).update_attributes({:key => 'smtp_settings_user_name'})
    Setting.by_key(:smtp_mail_account_pwd).update_attributes({:key => 'smtp_settings_password'})
    Setting.by_key(:requests_email_name).update_attributes({:label => 'PLG Email To Name', :key => 'to_email_name'})
    Setting.by_key(:requests_email).update_attributes({:label => 'PLG Email To', :key => 'to_email'})

    Setting.create!([
                        {:label => 'SMTP Authentication Type', :key => 'smtp_settings_authentication',       :value => 'login' },
                        {:label => 'Enable TLS',               :key => 'smtp_settings_enable_starttls_auto', :value => 1       }
                    ])

  end

  def down
    Setting.find_by({:key => 'smtp_settings_authentication'}).andand.destroy
    Setting.find_by({:key => 'smtp_settings_enable_starttls_auto'}).andand.destroy
    Setting.create!({:label => 'Connection Prefix', :key => 'connection_prefix', :value => 'tls'})
  end

end
