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
    expect(subject.rows).to eq EXPECTED_BOARD
  end

  it '#rows(:reverse)' do
    expect(subject.rows(:reverse)).to eq EXPECTED_BOARD.map(&:reverse)
  end

  it '#columns' do
    expect(subject.columns).to eq EXPECTED_BOARD.transpose
  end

  it '#columns' do
    expect(subject.columns(:reverse)).to eq EXPECTED_BOARD.transpose
                                                          .map(&:reverse)
  end
end
