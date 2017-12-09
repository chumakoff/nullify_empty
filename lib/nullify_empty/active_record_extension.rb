module NullifyEmpty
  module ActiveRecordExtension
    def nullify_empty(*attr_names)
      return unless connection.table_exists? table_name

      (column_names & attr_names.map(&:to_s)).each do |attr_name|
        original_type_klass = attribute_types[attr_name.to_s].class

        new_type_klass =
          NULLIFY_EMPTY_TYPES.find { |_, klass| klass.superclass == original_type_klass }.first

        attribute attr_name, new_type_klass
      end
    end
  end
end
