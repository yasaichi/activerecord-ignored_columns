# frozen_string_literal: true

require "active_support/lazy_load_hooks"
require_relative "ignored_columns/model_schema"
require_relative "ignored_columns/query_methods"
require_relative "ignored_columns/version"

ActiveSupport.on_load(:active_record) do
  if ActiveRecord.version < Gem::Version.create("5")
    include(ActiveRecord::IgnoredColumns::ModelSchema)
  end

  if ActiveRecord.version < Gem::Version.create("5.1")
    ActiveRecord::Relation.include(ActiveRecord::IgnoredColumns::QueryMethods)
  end
end
