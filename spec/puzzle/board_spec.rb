# frozen_string_literal: true

require 'word_search/common/letter'
require 'word_search/puzzle/board'

RSpec.describe WordSearch::Puzzle::Board.new do
  it '#parse converts formatted string to puzzle' do
    described_class.parse("C,B\nR,T")
    expected_letter = described_class[0][0]
    expect(expected_letter).to be_a WordSearch::Common::Letter
    expect(expected_letter.char).to eql 'C'
    expect(expected_letter.found?).to be_truthy
  end
end
