module NullifyEmpty
  class NullifyEmptyStringType < ActiveRecord::Type::String; end
  class NullifyEmptyTextType < ActiveRecord::Type::Text; end

  NULLIFY_EMPTY_TYPES = {nullify_empty_string: NullifyEmptyStringType, 
                         nullify_empty_text: NullifyEmptyTextType}
  
  NULLIFY_EMPTY_TYPES.values.each do |klass|
    klass.class_eval do
      def cast(value)
        value = nil if value.respond_to?(:empty?) && value.empty?
        super value
      end    
    end
  end  
end
