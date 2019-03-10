# frozen_string_literal: true

require 'word_search/solver'

RSpec.describe WordSearch::Solver do
  subject { WordSearch::Solver.new }

  it { is_expected.to have_attributes(solution: []) }

  it '#collect_arrangements' do
    subject.board = board = instance_double(WordSearch::Puzzle::Board)
    WordSearch::Puzzle::Board::ARRANGEMENTS.each do |arrangement|
      expect(board).to receive(arrangement).with(no_args)
      expect(board).to receive(arrangement).with(:reverse)
    end
    subject.collect_arrangements
  end
end
