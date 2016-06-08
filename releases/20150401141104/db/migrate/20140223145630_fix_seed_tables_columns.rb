class FixSeedTablesColumns < Migration::ClearMigration
  def up
    Rails.application.eager_load!
    Base::SeedModel.tables.each do |table_name|
      rename_column table_name.to_sym, :name, :name_en
      current_model = table_name.to_s.classify.constantize
      unless current_model.new.respond_to?(:code)
        add_column table_name, :code, :string
        current_model.reset_column_information
        current_model.find_each { |model| model.update_attributes!({:code => model.name_en.underscore})  }
      end
    end
    Country.where(:nationality => nil).destroy_all
    Country.where(:code => 'AX').destroy_all
    Country.find_each { |c| c.update_attributes!({:code => c.code.downcase, :currency_code => c.currency_code.downcase}) }
  end

  def down
    Rails.application.eager_load!
    Base::SeedModel.tables.each do |table_name|
      rename_column table_name.to_sym, :name_en, :name
    end
  end
end
