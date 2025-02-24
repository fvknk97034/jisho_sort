require 'spec_helper'

describe JishoSort::Sortable do
  describe 'String#compare_by_furigana' do
    context 'when a valid argument is passed' do
      let(:text1) { '花より団子' }
      let(:text2) { 'ありがとうございます' }

      it 'is expected to return number that has been jisho_sort_by by reading' do
        expect(text1.compare_by_furigana(text2)).to eq 1
      end

      it 'is expected to return number that has been jisho_sort_by by reading' do
        expect(text1.compare_by_furigana(text1)).to eq 0
      end

      it 'is expected to return number that has been jisho_sort_by by reading' do
        expect(text2.compare_by_furigana(text1)).to eq (-1)
      end
    end

    context 'when a invalid argument is passed' do
      let(:text1) { '花より団子' }

      context 'when a number' do
        let(:text2) { 1 }

        it 'is expected to raise error' do
          expect { text1.compare_by_furigana(text2) }.to raise_error ArgumentError
        end
      end

      context 'when a boolean' do
        let(:text2) { true }

        it 'is expected to raise error' do
          expect { text1.compare_by_furigana(text2) }.to raise_error ArgumentError
        end
      end

      context 'when a nil' do
        let(:text2) { nil }

        it 'is expected to raise error' do
          expect { text1.compare_by_furigana(text2) }.to raise_error ArgumentError
        end
      end

      context 'when a array' do
        let(:text2) { ['ありがとうございます'] }

        it 'is expected to raise error' do
          expect { text1.compare_by_furigana(text2) }.to raise_error ArgumentError
        end
      end

      context 'when a hash' do
        let(:text2) { { text: 'ありがとうございます' } }

        it 'is expected to raise error' do
          expect { text1.compare_by_furigana(text2) }.to raise_error ArgumentError
        end
      end
    end
  end
end
