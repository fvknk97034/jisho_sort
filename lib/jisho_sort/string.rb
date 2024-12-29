require 'jisho_sort/tokenizable'
require 'jisho_sort/sortable'

class String
  include JishoSort::Tokenizable
  include JishoSort::Sortable

  alias old_compare <=>
  alias <=> compare_by_furigana
end
