class CreateRequestCallbacks < Migration::TableMigration
  def up
    create_table :request_callbacks do |t|
      t.references :user, :null => false
      t.boolean :status,  :null => false, :default => false
      t.string  :phone,   :null => false, :limit => 20
    end

    execute 'ALTER TABLE request_callbacks MODIFY id INT(11) UNSIGNED;'

    RequestCallback.reset_column_information

    drop_table :user_callbacks
  end

  def down
    create_table :user_callbacks do |t|
      t.boolean :status,  :null => false, :default => false
      t.string  :phone,   :null => false, :limit => 20
      t.references :user, :null => false
    end

    drop_table :request_callbacks
  end

end
