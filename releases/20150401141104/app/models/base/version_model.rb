class Base::VersionModel < Base::Model
  self.abstract_class = true

  has_paper_trail

  def history
    PaperTrail::Version.where({:item_type => self.class.name, :item_id => id}).to_a.map(&:reify)
  end

  class << self

    def destroyed_objects_by_user(user)
      PaperTrail::Version.where({:item_type => self.name, :whodunnit => user.id, :event => 'destroy'}).to_a.map(&:reify).compact
    end

    def versionable_models
      @versionable_models ||= descendants.select { |child| !child.abstract_class }
    end
    alias :models :versionable_models

    def versionable_tables
      @versionable_tables ||= versionable_models.map(&:table_name)
    end
    alias :tables :versionable_tables

  end

end