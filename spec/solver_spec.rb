# frozen_string_literal: true

require 'word_search/solver'

RSpec.describe WordSearch::Solver do
  subject { WordSearch::Solver.new }
  let(:board) { instance_double(WordSearch::Puzzle::Board) }

  it { is_expected.to have_attributes(solution: []) }

  it '#collect_arrangements' do
    WordSearch::Puzzle::Board::ARRANGEMENTS.each do |arrangement|
      expect(board).to receive(arrangement).with(no_args)
      expect(board).to receive(arrangement).with(:reverse)
    end
    subject.collect_arrangements(board)
  end

  it '#board= alias of collect_arrangements' do
    expect(subject.method(:board=)).to eq subject.method(:collect_arrangements)
  end
end
