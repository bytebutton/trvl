require 'active_record/connection_adapters/abstract_adapter'

module ActiveRecord
  module ConnectionAdapters
    class AbstractAdapter

      class SchemaCreation
        def visit_AddColumn(o)
          sql_type = type_to_sql(o.type.to_sym, o.limit, o.precision, o.scale, o.unsigned)
          sql = "ADD #{quote_column_name(o.name)} #{sql_type}"
          add_column_options!(sql, column_options(o))
        end

        def visit_ColumnDefinition(o)
          sql_type = type_to_sql(o.type.to_sym, o.limit, o.precision, o.scale, o.unsigned)
          column_sql = "#{quote_column_name(o.name)} #{sql_type}"
          add_column_options!(column_sql, column_options(o)) unless o.primary_key?
          column_sql
        end

        def type_to_sql(type, limit, precision, scale, unsigned)
          @conn.type_to_sql type.to_sym, limit, precision, scale, unsigned
        end
      end

    end
  end
end
