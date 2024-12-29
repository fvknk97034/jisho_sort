require 'spec_helper'

describe JishoSort::Sortable do
  describe 'Array#sort' do
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

        it 'is expected to return an array that has been sorted by reading' do
          expect(inputs.sort).to eq [
            '明日をも知れぬ身',
            'ありがとうございます',
            'ハッピーバースデー',
            '花より団子'
          ]
        end
        #  rubocop:enable Style/WordArray

        it 'is expected to be non-destructive' do
          inputs.sort
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
          expect { inputs.sort }.to raise_error ArgumentError
        end
      end
    end
  end

  describe 'Enumerator#sort' do
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

        it 'is expected to return an enumerator that has been sorted by reading' do
          #  rubocop:disable Style/WordArray
          expect(inputs.sort).to eq [
            '明日をも知れぬ身',
            'ありがとうございます',
            'ハッピーバースデー',
            '花より団子'
          ]
          #  rubocop:enable Style/WordArray
        end

        it 'is expected to be non-destructive' do
          inputs.sort
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
          expect { inputs.sort }.to raise_error ArgumentError
        end
      end
    end
  end
end
