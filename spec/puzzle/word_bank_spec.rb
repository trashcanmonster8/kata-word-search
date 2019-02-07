# frozen_string_literal: true

require 'word_search/puzzle/word_bank'

RSpec.describe WordSearch::Puzzle::WordBank.new('thing', 'test') do
  it '#[] accesses a word' do
    expect(described_class[0]).to be_a WordSearch::Common::Word
  end
end
