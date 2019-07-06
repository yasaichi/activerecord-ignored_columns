# frozen_string_literal: true

module ActiveRecord
  module IgnoredColumns
    module QueryMethods
      # Override
      private def build_select(arel, *args)
        if args.empty? # ActiveRecord 4.1 or later
          return super(arel) if select_values.any? || !klass.ignored_columns.any?
        else
          selects = args.first
          return super(arel, selects) if !selects.empty? || !klass.ignored_columns.any?
        end

        arel.project(*klass.column_names.map { |name|
          table[klass.attribute_aliases[name.to_s] || name] # arel_attribute(name)
        })
      end
    end
  end
end
