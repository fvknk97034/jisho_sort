require 'natto'

module JishoSort
  module Tokenizable
    NATTO_KATAKANA_TYPE = 7
    NATTO_FURIGANA_INDEX = 7

    def furigana
      tokenize
    end

    private

    def tokenize
      call_natto_parser
    end

    def call_natto_parser
      strings = separate_ascii_string_from_others

      nm = Natto::MeCab.new
      memo = []
      strings.each do |s|
        next memo << s if s.ascii_only?

        nm.parse(s) do |n|
          next if n.is_eos?
          next memo << n.surface if n.char_type == NATTO_KATAKANA_TYPE

          n_furigana = n.feature.split(',')[NATTO_FURIGANA_INDEX]

          memo << n_furigana
        end
      end

      memo.join
    end

    def separate_ascii_string_from_others
      chars.chunk_while { |s1, s2| s1.ascii_only? == s2.ascii_only? }
           .map(&:join)
    end
  end
end
