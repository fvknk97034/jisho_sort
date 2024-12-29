module JishoSort
  module Sortable
    def compare_by_furigana(other)
      furigana.old_compare(other.furigana)
    end
  end
end
