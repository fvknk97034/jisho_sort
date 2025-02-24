require 'jisho_sort/sortable'

module Enumerable
  include JishoSort::Sortable

  def jisho_sort(&block)
    raise ArgumentError if block.nil? && !all? { |item| item.instance_of?(String) }

    return sort { |a, b| a.compare_by_furigana(b) } if block.nil?

    sort(&block)
  end

  def jisho_sort_by(&block)
    raise ArgumentError unless all? { |item| yield(item).instance_of?(String) }

    sort_by{ |item| yield(item).furigana }
  end
end
