module ActiveRecord
  module RailsAdminEnum
    def enum(definitions)
      super

      definitions.each do |name, values|

        define_method("#{ name }_enum") do
          self.class.send(name.to_s.pluralize).to_a.map{|k,v| [I18n::t("#{self.class.name.underscore}.#{name.to_s.pluralize}.#{k}"), v.to_i]}.to_a
        end

        define_method("#{ name }=") do |value|
          if value.kind_of?(String) and value.to_i.to_s == value
            super(value.to_i)
          else
            super(value)
          end
        end

      end

    end
  end
end

ActiveRecord::Base.send(:extend, ActiveRecord::RailsAdminEnum)