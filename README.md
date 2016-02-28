# ActiveHash::Kaminari [![Build Status](https://travis-ci.org/monochromegane/active_hash-kaminari.svg?branch=master)](https://travis-ci.org/monochromegane/active_hash-kaminari)

ActiveHash::Kaminari provides [Kaminari](https://github.com/amatsuda/kaminari) paginator to [ActiveHash](https://github.com/zilkey/active_hash).

## Usage

Just prepend `ActiveHash::Paginatable` module.

```rb
class Country < ActiveHash::Base
  prepend ActiveHash::Paginatable
  ...
end
```

So, ActiveHash class returns `Kaminari::PaginatableArray` instance that provides pagination methods (e.g. `page`, `per` and more page scope methods).

```rb
Country.all.page(1).per(10)
```

Of course, you can use this at view.

```rb
<%= paginate @counties %>
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_hash-kaminari'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_hash-kaminari

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/monochromegane/active_hash-kaminari.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

