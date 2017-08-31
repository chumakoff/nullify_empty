require "nullify_empty/version"

require "active_record"
require "nullify_empty/types"
require "nullify_empty/active_record_extension"

NullifyEmpty::NULLIFY_EMPTY_TYPES.each do |symbol, klass|
  ActiveRecord::Type.register(symbol, klass)
end

ActiveRecord::Base.extend NullifyEmpty::ActiveRecordExtension
