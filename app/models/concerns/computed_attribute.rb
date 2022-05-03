module ComputedAttribute
  extend ActiveSupport::Concern

  included do
    scope :select_table_columns, -> { select *column_names }
  end

  class_methods do
    def computed_attribute(name, sql_implementation, ruby_implementation)
      scope "select_#{name}", -> do
        select("(#{sql_implementation.to_sql}) AS #{name}".squish)
      end

      instance_variable_name = "@#{name}".to_sym
      define_method name do
        unless instance_variable_defined?(instance_variable_name)
          instance_variable_set(
            instance_variable_name,
            if attributes.include? name.to_s
              attributes[name.to_s]
            else
              instance_eval(&ruby_implementation)
            end
          )
        end
        instance_variable_get(instance_variable_name)
      end
    end
  end
end
