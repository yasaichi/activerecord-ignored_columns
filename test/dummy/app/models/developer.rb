# frozen_string_literal: true

class Developer < ApplicationRecord
  self.ignored_columns = %w(first_name last_name)

  attr_accessor :last_name

  # NOTE: The implementation of `define_attribute_method` has a bug, so skip
  # the following definition in Rails 4.1
  if ::Gem::Version.create(::Rails.version) >= ::Gem::Version.create("4.2")
    define_attribute_method "last_name"
  end
end
