# frozen_string_literal: true

$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "activerecord/ignored_columns/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "activerecord-ignored_columns"
  s.version     = ActiveRecord::IgnoredColumns::VERSION
  s.authors     = ["Yuichi Goto"]
  s.email       = ["yasaichi@users.noreply.github.com"]
  s.homepage    = "https://github.com/yasaichi/activerecord-ignored_columns"
  s.summary     = "Backport of ActiveRecord::Base.ignored_columns"
  s.description = "Backport of ActiveRecord::Base.ignored_columns into Rails 4 and 5.0"
  s.license     = "MIT"

  s.files = Dir["CHANGELOG.md", "lib/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "activerecord", ">= 4.0", "< 5.1"

  s.add_development_dependency "appraisal"
  s.add_development_dependency "railties"
  s.add_development_dependency "rubocop", "0.71.0"
  s.add_development_dependency "rubocop-performance"
  s.add_development_dependency "rubocop-rails"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "sqlite3", "< 1.4.0"
end
