# Farsi_Normalizer

FarsiNormalizer is a replacement for the Lucene [persian_normalizer](http://lucene.apache.org/core/4_9_0/analyzers-common/org/apache/lucene/analysis/fa/PersianNormalizer.html) written in ruby to use with elasticsearch or as a stand alone class

Instead of normalizing farsi\persian characters to arabic this gem normalize the arabic characters to farsi\persian

Normalization is defined as:
 - Normalization of [arabic kaf](https://unicode-table.com/en/0643/) to [farsi keheh](https://unicode-table.com/en/06A9/)
 - Normalization of [arabic yeh](https://unicode-table.com/en/064A/) and [arabic alef maksoura](https://unicode-table.com/en/0649/) to [farsi yeh](https://unicode-table.com/en/06CC/)

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


[1] pry(main)> FarsiNormalizer.normalize("ك")
=> "ک"

[2] pry(main)> FarsiNormalizer.new("ي").normalize
=> "ی"

[3] pry(main)> FarsiNormalizer.normalize("ك ي", only: ["ك"])
=> "ک ي"

[4] pry(main)> FarsiNormalizer.normalize("ك ي", only: ["ك"])
=> "ك ی"
```

### Questions or Problems?

If you have any issues with farsi_normalizer which you cannot find the solution, please add an [issue on GitHub][https://github.com/mshka/farsi_normalizer/issues] or fork the project and send a pull request.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
