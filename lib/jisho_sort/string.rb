require 'jisho_sort/tokenizable'
require 'jisho_sort/comparable'

class String
  include JishoSort::Tokenizable
  include JishoSort::Comparable
end
