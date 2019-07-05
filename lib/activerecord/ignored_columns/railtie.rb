# frozen_string_literal: true

require "active_support/lazy_load_hooks"
require "rails/railtie"
require_relative "model_schema"
require_relative "query_methods"

module ActiveRecord
  module IgnoredColumns
    class Railtie < ::Rails::Railtie
      initializer "active_record.ignored_columns" do
        ::ActiveSupport.on_load(:active_record) do
          rails_version = ::Rails.respond_to?(:gem_version) ?
            ::Rails.gem_version : ::Gem::Version.create(::Rails.version)

          if rails_version < ::Gem::Version.create("5")
            include ::ActiveRecord::IgnoredColumns::ModelSchema
          end

          if rails_version < ::Gem::Version.create("5.1")
            ::ActiveRecord::Relation.include(::ActiveRecord::IgnoredColumns::QueryMethods)
          end
        end
      end
    end
  end
end
