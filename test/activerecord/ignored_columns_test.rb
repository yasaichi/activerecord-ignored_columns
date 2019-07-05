# frozen_string_literal: true

require "test_helper"

class Activerecord::IgnoredColumns::Test < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Activerecord::IgnoredColumns
  end
end
