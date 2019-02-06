# frozen_string_literal: true

require 'word_bank'

RSpec.describe WordBank.new('thing', 'test') do
  it '#[] accesses a word' do
    expect(described_class[0]).to be_a Word
  end
end
