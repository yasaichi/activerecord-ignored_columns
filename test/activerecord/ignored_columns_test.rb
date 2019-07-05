# frozen_string_literal: true

require "test_helper"

# Borrowed from https://github.com/rails/rails/blob/5-1-stable/activerecord/test/cases/base_test.rb
class ActiveRecord::IgnoredColumns::Test < ActiveSupport::TestCase
  test "ignored columns are not present in columns_hash" do
    cache_columns = Developer.connection.schema_cache.columns_hash(Developer.table_name)
    assert_includes cache_columns.keys, "first_name"
    assert_not_includes Developer.columns_hash.keys, "first_name"
    assert_not_includes SubDeveloper.columns_hash.keys, "first_name"
    assert_not_includes SymbolIgnoredDeveloper.columns_hash.keys, "first_name"
  end

  test "ignored columns have no attribute methods" do
    assert_not Developer.new.respond_to?(:first_name)
    assert_not Developer.new.respond_to?(:first_name=)
    assert_not Developer.new.respond_to?(:first_name?)
    assert_not SubDeveloper.new.respond_to?(:first_name)
    assert_not SubDeveloper.new.respond_to?(:first_name=)
    assert_not SubDeveloper.new.respond_to?(:first_name?)
    assert_not SymbolIgnoredDeveloper.new.respond_to?(:first_name)
    assert_not SymbolIgnoredDeveloper.new.respond_to?(:first_name=)
    assert_not SymbolIgnoredDeveloper.new.respond_to?(:first_name?)
  end

  test "ignored columns don't prevent explicit declaration of attribute methods" do
    assert Developer.new.respond_to?(:last_name)
    assert Developer.new.respond_to?(:last_name=)
    assert SubDeveloper.new.respond_to?(:last_name)
    assert SubDeveloper.new.respond_to?(:last_name=)
    assert SymbolIgnoredDeveloper.new.respond_to?(:last_name)
    assert SymbolIgnoredDeveloper.new.respond_to?(:last_name=)

    # NOTE: The implementation of `define_attribute_method` has a bug, so skip
    # these assertions in Rails 4.1
    if Gem::Version.create(Rails.version) >= Gem::Version.create("4.2")
      assert Developer.new.respond_to?(:last_name?)
      assert SubDeveloper.new.respond_to?(:last_name?)
      assert SymbolIgnoredDeveloper.new.respond_to?(:last_name?)
    end
  end

  test "ignored columns are stored as an array of string" do
    assert_equal(%w(first_name last_name), Developer.ignored_columns)
    assert_equal(%w(first_name last_name), SymbolIgnoredDeveloper.ignored_columns)
  end

  test "when #reload called, ignored columns' attribute methods are not defined" do
    developer = Developer.create!(name: "Developer")
    assert_not developer.respond_to?(:first_name)
    assert_not developer.respond_to?(:first_name=)

    developer.reload

    assert_not developer.respond_to?(:first_name)
    assert_not developer.respond_to?(:first_name=)
  end

  test "ignored columns not included in SELECT" do
    query = Developer.all.to_sql

    # ignored column
    assert_not query.include?("first_name")

    # regular column
    assert query.include?("name")
  end
end
