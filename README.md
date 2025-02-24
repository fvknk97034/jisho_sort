# jisho_sort

`jisho_sort` is a Ruby sorting library based on MeCab.
It provides functionality to sort Japanese strings containing a mix of Chinese and Japanese Letters in dictionary order.

## Installation

This code depends on MeCab, so you need to install MeCab.
For more MeCab Install instructions, please refer to the [MeCab installation guide](https://taku910.github.io/mecab/#install).

After installing MeCab, Add this line to Gemfile:

```ruby
gem 'jisho_sort'
```

And then execute:

```sh
bundle install
```

Or install it as:

```sh
gem install jisho_sort
```

## Usage

Here's a basic example of how to use JishoSort:

```ruby
require 'jisho_sort'

array = [
  'ゆく川の流れは絶えずして、しかももとの水にあらず',
  'メロスは激怒した',
  '国境の長いトンネルを抜けると雪国であった'
]
```

When you run this code, you will get the following result:

```sh
$ ruby sample.rb
=> ["ゆく川の流れは絶えずして、しかももとの水にあらず", "メロスは激怒した", "国境の長いトンネルを抜けると雪国であった"]
```


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
