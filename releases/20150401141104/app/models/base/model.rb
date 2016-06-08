class Base::Model < ActiveRecord::Base
  self.abstract_class = true

  BASE_MODEL_CHILDREN_NAMES = %w(Base::SeedModel Base::VersionModel)
  def self.inherited(child_class)
    super
    unless BASE_MODEL_CHILDREN_NAMES.include?(child_class.name) || (child_class.ancestors.map(&:name) & BASE_MODEL_CHILDREN_NAMES).any?
      raise "#{child_class.name} mistakenly inherits from BaseAbstractModel - use one of BaseAbstractModel child classes as parent for #{child_class.name}\n"
    end
  end

  class << self

    def random_record
      self.offset(rand(self.count)).first
    end

    def random_record_id
      self.random_record.andand.id
    end

    def random_record_ids(limit)
      select('id').offset(rand(self.count)).limit(limit).sample(limit).map(&:id)
    end

  end

end
