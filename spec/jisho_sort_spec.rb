require 'spec_helper'

describe JishoSort::Tokenizer do
  it do
    expect(JishoSort::Tokenizer.new.class).to eq JishoSort::Tokenizer
  end
end
