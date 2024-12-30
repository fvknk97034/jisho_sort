require 'bundler/setup'
require 'jisho_sort'

# rubocop:disable Style/WordArray
array = [
  'メロスは激怒した',
  '国境の長いトンネルを抜けると雪国であった',
  'つれづれなるままに'
]
# rubocop:enable Style/WordArray

p array
p array.sort
