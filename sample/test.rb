require 'bundler/setup'
require 'jisho_sort'

# rubocop:disable Style/WordArray
array = [
  'ゆく川の流れは絶えずして、しかももとの水にあらず',
  'メロスは激怒した',
  '国境の長いトンネルを抜けると雪国であった'
]
# rubocop:enable Style/WordArray

p array
p array.jisho_sort
