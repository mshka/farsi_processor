# Farsi Normalizer <img style="float: left;" src="https://circleci.com/gh/mshka/farsi_processor.svg?style=svg">

FarsiProcessor is a ruby gem to normalize and stem Persian/Farsi text

Normalization is defined as:
 - Normalization of [arabic kaf](https://unicode-table.com/en/0643/) to [farsi keheh](https://unicode-table.com/en/06A9/)
 - Normalization of [arabic yeh](https://unicode-table.com/en/064A/) and [arabic alef maksoura](https://unicode-table.com/en/0649/) to [farsi yeh](https://unicode-table.com/en/06CC/)
 - Normalization of [alef mada](https://unicode-table.com/en/0622/), [alef with hamza below](https://unicode-table.com/en/0625/) and [alef with hamza above](https://unicode-table.com/en/0623/) to [alef](https://unicode-table.com/en/0627/)
 - Removing [TATWIL](https://unicode-table.com/en/0640/)
 - Removing [DIACRITICS](https://github.com/mshka/farsi_processor/blob/master/lib/farsi_normalizer.rb#L18-L25)

Stemming is defined as removing these [suffixes (+ suffixes of plural form)](https://github.com/mshka/farsi_processor/blob/master/lib/farsi_stemmer.rb#L19-L28)


## Installation

Add this line to your application's Gemfile:

```ruby
gem "farsi_processor"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install farsi_processor

## Usage

```ruby
require 'farsi_processor'

[1] pry(main)> FarsiProcessor.process("ك")
=> "ک"

[2] pry(main)> FarsiProcessor.process("کتاب‌ ها")
=> "کتاب"

# it supports only and except options
[3] pry(main)> FarsiProcessor.process("ك ي", only: ["ك"])
=> "ک ي"

[4] pry(main)> FarsiProcessor.process("ك ي", except: ["ك"])
=> "ك ی"

[5] pry(main)> FarsiProcessor.process('دخترهای', except: ['های'])
=> "دختره"

# you can choose to just normalize or stem a word,
# they also support an only and except option
[6] pry(main)> FarsiProcessor.normalize("ك")
=> "ک"

[7] pry(main)> FarsiProcessor.stem("کتاب‌ ها")
=> "کتاب"

```

### Questions or Problems?

If you have any issues with farsi_processor which you cannot find the solution, please add an [issue on GitHub](https://github.com/mshka/farsi_processor/issues) or fork the project and send a pull request.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
