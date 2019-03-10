# frozen_string_literal: true

require 'word_search/puzzle/word_bank'

RSpec.describe WordSearch::Puzzle::WordBank do
  subject { WordSearch::Puzzle::WordBank.new('thing', 'test') }

  it '#[]' do
    expect(subject[0]).to eq 'thing'
  end
end
