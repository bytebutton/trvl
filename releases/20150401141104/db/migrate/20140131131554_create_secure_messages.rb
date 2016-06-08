class CreateSecureMessages < Migration::TableMigration
  def up
    create_table :secure_messages do |t|
      t.references :user,               :null => false
      t.text :text
    end

    execute 'ALTER TABLE secure_messages MODIFY id INT(11) UNSIGNED;'

    SecureMessage.reset_column_information

    remove_foreign_key(:user_messages, :name => 'user_messages_ibfk_1')
    drop_table :user_messages
  end

  def down
    create_table :user_messages do |t|
      t.references :user, :null => false
      t.text :text
    end

    add_foreign_key :user_messages, :users

    drop_table :secure_messages
  end
end
