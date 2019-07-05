$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "activerecord/ignored_columns/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "activerecord-ignored_columns"
  s.version     = Activerecord::IgnoredColumns::VERSION
  s.authors     = ["yasaichi"]
  s.email       = ["yasaichi@users.noreply.github.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Activerecord::IgnoredColumns."
  s.description = "TODO: Description of Activerecord::IgnoredColumns."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.7", ">= 5.0.7.2"

  s.add_development_dependency "sqlite3"
end
