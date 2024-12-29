require 'natto'

module JishoSort
  module Tokenizable
    def furigana
      tokenize
    end

    private

    def tokenize
      call_natto_parser
    end

    def call_natto_parser
      strings = separate_ascii_string_from_others

      nm = Natto::MeCab.new('-F%f[7]')
      memo = []
      strings.each do |s|
        next memo << s if s.ascii_only?

        nm.parse(s) do |n|
          memo << n.feature unless n.is_eos?
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
