# frozen_string_literal: true

module Activerecord
  module IgnoredColumns
    module QueryMethods
      def self.included(active_record_relation)
        active_record_relation.prepend(PrependMethods)
      end

      module PrependMethods
        private def build_select(arel)
          return super if select_values.any? || !klass.ignored_columns.any?

          arel.project(*klass.column_names.map { |name|
            table[attribute_alias?(name) ? attribute_alias(name) : name]
          })
        end
      end
    end
  end
end
