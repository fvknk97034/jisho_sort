module JishoSort
  module Comparable
    def compare_by_furigana(other)
      raise ArgumentError unless other.instance_of?(String)

      furigana <=> other.furigana
    end
  end
end
