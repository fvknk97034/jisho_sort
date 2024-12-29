require 'spec_helper'

describe JishoSort::Tokenizable do
  context 'when a valid argument is passed' do
    context 'when it does not contain alphabets or symbols' do
      let(:input_text) { '情報の扱い方と価値' }

      it 'is expected to return the reading of the string' do
        expect(input_text.furigana).to eq 'ジョウホウノアツカイカタトカチ'
      end
    end

    context 'when it contain alphabets' do
      let(:input_text) { 'Rubyはオープンソースのプログラミング言語' }

      it 'is expected to return the reading of the string' do
        expect(input_text.furigana).to eq 'Rubyハオープンソースノプログラミングゲンゴ'
      end
    end

    context 'when it contain marks' do
      let(:input_text) { 'よい天気ですね! 今日の予定はなんですか?' }

      it 'is expected to return the reading of the string' do
        expect(input_text.furigana).to eq 'ヨイテンキデスネ! キョウノヨテイハナンデスカ?'
      end
    end

    context 'when it does not contain hiragana, katakana and kanji' do
      let(:input_text) { 'Hello, World!' }

      it 'is expected that the string will be returned unconverted.' do
        expect(input_text.furigana).to eq 'Hello, World!'
      end
    end

    context 'when a empty string is passed' do
      let(:input_text) { '' }

      it 'is expected that the string will be returned unconverted.' do
        expect(input_text.furigana).to eq ''
      end
    end
  end
end
