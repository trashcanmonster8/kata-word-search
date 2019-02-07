# frozen_string_literal: true

require 'word_search/common/letter'
require 'word_search/puzzle/board'

RSpec.describe WordSearch::Puzzle::Board do
  EXPECTED_BOARD = [%w(C B), %w(R T)].freeze

  before(:all) do
    @test_obj = described_class.new("C,B\nR,T")
  end

  EXPECTED_BOARD.each_with_index do |row, j|
    row.each_with_index do |char, i|
      it "Creates the board with the correct letter at #{i} x #{j}" do
        expect(@test_obj[j][i]).to eq WordSearch::Common::Letter.new(char, i, j)
      end
    end
  end
end
