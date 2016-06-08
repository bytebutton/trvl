# a bit of error-proofing for migration classes (inherit from BaseMigration child classes whenever possible)
module MigrationInheritanceControl
  AR_MIGRATION_CHILDREN_NAMES = %w(Migration::BaseMigration)

  def inherited(child_class)
    super
    unless child_class.name.start_with?('ActiveRecord::') || AR_MIGRATION_CHILDREN_NAMES.include?(child_class.name) || (child_class.ancestors.map(&:name) & AR_MIGRATION_CHILDREN_NAMES).any?
      raise "#{child_class.name} mistakenly inherits from ActiveRecord::Migration - use one of custom migration classes as parent for #{child_class.name} or adjust MigrationInheritanceControl::AR_MIGRATION_CHILDREN_NAMES\n"
    end
  end

end

ActiveRecord::Migration.send(:extend, MigrationInheritanceControl)