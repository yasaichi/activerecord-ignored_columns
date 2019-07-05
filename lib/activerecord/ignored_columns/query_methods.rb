# frozen_string_literal: true

module ActiveRecord
  module IgnoredColumns
    module QueryMethods
      def self.included(active_record_relation)
        active_record_relation.prepend(PrependMethods)
      end

      module PrependMethods
        # Override
        private def build_select(arel, selects = [])
          if !selects.empty? || select_values.any? || !klass.ignored_columns.any?
            return former_build_select_implementation? ? super : super(arel)
          end

          arel.project(*klass.column_names.map { |name|
            table[klass.attribute_aliases[name] || name]
          })
        end

        private def former_build_select_implementation?
          @former_build_select_implementation ||= method(:build_select).super_method.arity == 2
        end
      end
    end
  end
end
