# activerecord-ignored_columns

[![Gem Version](https://badge.fury.io/rb/activerecord-ignored_columns.svg)](http://badge.fury.io/rb/activerecord-ignored_columns)
[![Build Status](https://travis-ci.org/yasaichi/activerecord-ignored_columns.svg?branch=master)](https://travis-ci.org/yasaichi/activerecord-ignored_columns)
[![Code Climate](https://codeclimate.com/github/yasaichi/activerecord-ignored_columns/badges/gpa.svg)](https://codeclimate.com/github/yasaichi/activerecord-ignored_columns)
[![Test Coverage](https://codeclimate.com/github/yasaichi/activerecord-ignored_columns/badges/coverage.svg)](https://codeclimate.com/github/yasaichi/activerecord-ignored_columns/coverage)

`activerecord-ignored_columns` is a backport of `ActiveRecord::Base.ignored_columns` (introduced in
Rails 5) into Rails 4.  
You can also use this gem for Rails 5.0 because it fixes one serious bug in the version (see
[PR #30980](https://github.com/rails/rails/pull/30980)).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activerecord-ignored_columns'
```

And then execute:

```bash
$ bundle
```

## Usage

Set columns names that a model should ignore as follows:

```ruby
class UserProfile < ActiveRecord::Base
  self.ignored_columns = %i(full_name)
end
```

Ignored columns won't have attribute accessors defined, and won't be referenced in SQL queries.

## Contributing

You should follow the steps below.

1. [Fork the repository](https://help.github.com/articles/fork-a-repo/)
2. Create a feature branch: `git checkout -b add-new-feature`
3. Commit your changes: `git commit -am 'Add new feature'`
4. Push the branch: `git push origin add-new-feature`
5. [Send us a pull request](https://help.github.com/articles/about-pull-requests/)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
