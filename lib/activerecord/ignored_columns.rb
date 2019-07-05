# frozen_string_literal: true

require_relative "ignored_columns/version"

if defined?(Rails)
  require_relative "ignored_columns/railtie"
end
