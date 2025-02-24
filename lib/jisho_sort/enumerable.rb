require 'jisho_sort/sortable'

module Enumerable
  include JishoSort::Sortable

  # Sorts an array of strings using the Japanese pronunciation (dictionary)order.
  # If a block is given, it sorts using the provided block.
  #
  # @yield [a, b] Optional block to customize the sorting logic.
  # @yieldparam a [String] The first string to compare.
  # @yieldparam b [String] The second string to compare.
  # @return [Array<String>] The sorted array.
  # @raise [ArgumentError] If no block is given and any element is not a String.
  def jisho_sort(&block)
    raise ArgumentError if block.nil? && !all? { |item| item.instance_of?(String) }

    return sort { |a, b| a.compare_by_furigana(b) } if block.nil?

    sort(&block)
  end

  # Sorts the elements of the enumerable based on the japanese pronunciation of the strings
  # returned by the given block.
  #
  # @yield [item] Gives each element of the enumerable to the block.
  # @yieldreturn [String] The string whose japanese pronunciation will be used for sorting.
  # @return [Array] A new array with the elements sorted by the japanese pronunciation of the strings.
  # @raise [ArgumentError] If any element does not yield a String.
  def jisho_sort_by
    raise ArgumentError unless all? { |item| yield(item).instance_of?(String) }

    sort_by{ |item| yield(item).furigana }
  end
end
