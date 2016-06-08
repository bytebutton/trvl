# a bit of error-proofing for migration classes (inherit from BaseMigration child classes whenever possible)
module ModelInheritanceControl
  AR_BASE_CHILDREN_NAMES = %w(Base::Model PaperTrail::Version)

  # def inherited(child_class)
  #   super
  #   unless child_class.name.start_with?('ActiveRecord::') || AR_BASE_CHILDREN_NAMES.include?(child_class.name) || (child_class.ancestors.map(&:name) & AR_BASE_CHILDREN_NAMES).any?
  #     raise "#{child_class.name} mistakenly inherits from ActiveRecord::Base - use one of custom model classes as parent for #{child_class.name} or adjust ModelInheritanceControl::AR_BASE_CHILDREN_NAMES\n"
  #   end
  # end
end

ActiveRecord::Base.send(:extend, ModelInheritanceControl)