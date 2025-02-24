module JishoSort
  module Sortable
    def compare_by_furigana(other)
      furigana <=> other.furigana
    end
  end
end
