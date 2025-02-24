require 'spec_helper'

describe JishoSort::Sortable do
  describe 'Array#jisho_sort without block' do
    context 'when a valid argument is passed' do
      context 'when a array of strings is passed' do
        #  rubocop:disable Style/WordArray
        let(:inputs) do
          [
            '花より団子',
            '明日をも知れぬ身',
            'ありがとうございます',
            'ハッピーバースデー'
          ]
        end

        it 'is expected to return an array that has been jisho_sort_by by reading' do
          expect(inputs.jisho_sort).to eq [
            '明日をも知れぬ身',
            'ありがとうございます',
            'ハッピーバースデー',
            '花より団子'
          ]
        end
        #  rubocop:enable Style/WordArray

        it 'is expected to be non-destructive' do
          inputs.jisho_sort
          expect(inputs).to eq inputs
        end
      end
    end

    context 'when a invalid argument is passed' do
      context 'when a array contains non-string' do
        let(:inputs) do
          [
            1,
            ['Hello'],
            'ハッピーバースデー'
          ]
        end

        it 'is expected to raise error' do
          expect { inputs.jisho_sort }.to raise_error ArgumentError
        end
      end
    end
  end

  describe 'Array#jisho_sort with block' do
    context 'when a valid argument is passed' do
      context 'when a array of strings is passed' do
        #  rubocop:disable Style/WordArray
        let(:inputs) do
          [
            '花より団子',
            '明日をも知れぬ身',
            'ありがとうございます',
            'ハッピーバースデー'
          ]
        end

        it 'is expected to return an array that has been jisho_sort_by by reading' do
          expect(inputs.jisho_sort { |a, b| b.compare_by_furigana(a) }).to eq [
            '花より団子',
            'ハッピーバースデー',
            'ありがとうございます',
            '明日をも知れぬ身'
          ]
        end
        #  rubocop:enable Style/WordArray

        it 'is expected to be non-destructive' do
          inputs.jisho_sort { |a, b| b.compare_by_furigana(a) }
          expect(inputs).to eq inputs
        end
      end
    end

    context 'when a invalid argument is passed' do
      context 'when a array contains non-string' do
        let(:inputs) do
          [
            1,
            ['Hello'],
            'ハッピーバースデー'
          ]
        end

        it 'is expected to raise error' do
          expect { inputs.jisho_sort { |a, b| b <=> a } }.to raise_error ArgumentError
        end
      end
    end
  end

  describe 'Array#jisho_sort_by with block' do
    context 'when a valid argument is passed' do
      context 'when a hash of string values is passed' do
        #  rubocop:disable Style/WordArray
        let(:inputs) do
          [
            { id: 1, name: '花より団子' },
            { id: 2, name: '明日をも知れぬ身' },
            { id: 3, name: 'ありがとうございます' },
            { id: 4, name: 'ハッピーバースデー' }
          ]
        end

        it 'is expected to return an array that has been jisho_sort_by reading' do
          expect(inputs.jisho_sort_by { |i| i[:name] }).to eq [
            { id: 2, name: '明日をも知れぬ身' },
            { id: 3, name: 'ありがとうございます' },
            { id: 4, name: 'ハッピーバースデー' },
            { id: 1, name: '花より団子' }
          ]
        end
        #  rubocop:enable Style/WordArray

        it 'is expected to be non-destructive' do
          inputs.jisho_sort_by { |i| i[:name] }
          expect(inputs).to eq inputs
        end
      end
    end

    context 'when a invalid argument is passed' do
      context 'when a array contains non-string' do
        let(:inputs) do
          [
            { id: 1, name: 1 },
            { id: 2, name: ['Hello'] },
            { id: 3, name: 'ハッピーバースデー' }
          ]
        end

        it 'is expected to raise error' do
          expect { inputs.jisho_sort_by { |i| i[:name] } }.to raise_error ArgumentError
        end
      end
    end
  end

  describe 'Enumerator#jisho_sort' do
    context 'when a valid argument is passed' do
      context 'when a enumerator of strings is passed' do
        let(:inputs) do
          Enumerator.new do |e|
            e << '花より団子'
            e << '明日をも知れぬ身'
            e << 'ありがとうございます'
            e << 'ハッピーバースデー'
          end
        end

        it 'is expected to return an enumerator that has been jisho_sort_by by reading' do
          #  rubocop:disable Style/WordArray
          expect(inputs.jisho_sort).to eq [
            '明日をも知れぬ身',
            'ありがとうございます',
            'ハッピーバースデー',
            '花より団子'
          ]
          #  rubocop:enable Style/WordArray
        end

        it 'is expected to be non-destructive' do
          inputs.jisho_sort
          expect(inputs).to eq inputs
        end
      end
    end

    context 'when a invalid argument is passed' do
      context 'when a array contains non-string' do
        let(:inputs) do
          {
            1 => 1,
            ['Hello'] => 2,
            'ハッピーバースデー': 3
          }
        end

        it 'is expected to raise error' do
          expect { inputs.jisho_sort }.to raise_error ArgumentError
        end
      end
    end
  end
end
