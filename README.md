# Farsi_Normalizer

FarsiNormalizer is a replacement for the Lucene [persian_normalizer](http://lucene.apache.org/core/4_9_0/analyzers-common/org/apache/lucene/analysis/fa/PersianNormalizer.html) written in ruby to use with elasticsearch or as a stand alone class

Instead of normalizing farsi\persian characters to arabic this gem normalize the arabic characters to farsi\persian

Normalization is defined as:
 - Normalization of arabic keh to farsi keheh
 - Normalization of arabic yeh and arabic alef maksoura to farsi yeh

## Installation

Add this line to your application's Gemfile:

```ruby
gem "farsi_normalizer"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install farsi_normalizer

## Usage

```ruby
require 'farsi_normalizer'


[1] pry(main)> FarsiNormalizer.normalize("بسکويت")
=> "بسکويت"

[2] pry(main)> FarsiNormalizer.new("بسکويت").normalize
=> "بسکويت"

[3] pry(main)> FarsiNormalizer.normalize("بسكويت", only: ["ك"])
=> "بسکويت"

[4] pry(main)> FarsiNormalizer.normalize("بسكويت", except: ["ك"])
=> "بسكویت"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mshka/farsi_normalizer. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
