module JishoSort
  module Comparable
    # Compares the current string include chines and japanese character with another string based on their japanese pronunciation(furigana).
    #
    # @param other [String] The object to compare with.
    # @return [Integer] Returns -1 if the current object's furigana is less than the other's, 0 if they are equal, and 1 if it is greater.
    def compare_by_furigana(other)
      raise ArgumentError unless other.instance_of?(String)

      furigana <=> other.furigana
    end
  end
end
