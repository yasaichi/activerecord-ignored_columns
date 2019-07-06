# frozen_string_literal: true

module ActiveRecord
  module IgnoredColumns
    module ModelSchema
      def self.included(active_record_base)
        active_record_base.class_exec do
          extend ClassMethods
          self.ignored_columns = [].freeze
        end
      end

      module ClassMethods
        # Override
        def columns
          @columns ||= super.reject { |column| ignored_columns.include?(column.name) }
        end

        def ignored_columns
          if defined?(@ignored_columns)
            @ignored_columns
          else
            superclass.ignored_columns
          end
        end

        def ignored_columns=(columns)
          @ignored_columns = columns.map(&:to_s)
        end
      end
    end
  end
end
