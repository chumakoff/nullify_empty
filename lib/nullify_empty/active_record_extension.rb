module NullifyEmpty
  module ActiveRecordExtension
    def nullify_empty(*attr_names)
      attr_names.each do |attr_name|
        original_type_klass = attribute_types[attr_name.to_s].class

        new_type_klass = 
          NULLIFY_EMPTY_TYPES.find { |_, klass| klass.superclass == original_type_klass }.first

        attribute attr_name, new_type_klass
      end
    end
  end
end
