# frozen_string_literal: true

require 'word_search/common/letter'
require 'word_search/puzzle/board'

RSpec.describe WordSearch::Puzzle::Board do
  subject { described_class.new("C,B,V\nR,T,M\nW,E,Q") }
  EXPECTED_BOARD = [%w[C B V], %w[R T M], %w[W E Q]].freeze

  EXPECTED_BOARD.each_with_index do |row, j|
    row.each_with_index do |char, i|
      it "Creates the board with the correct letter at #{i} x #{j}" do
        expect(subject[j][i]).to eq WordSearch::Common::Letter.new(char, i, j)
      end
    end
  end

  it '#rows' do
    row = EXPECTED_BOARD[0].each_with_index.map do |char, x|
      WordSearch::Common::Letter.new(char, x, 0)
    end
    expect(subject.rows[0]).to eq row
  end
end
