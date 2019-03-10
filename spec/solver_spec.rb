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

  context 'word is in the puzzle' do
    it '#search_arrangement adds word to solution' do
      arrangement = [line(0..3), line(0..13), line(10..13)]
      subject.search_arrangement(arrangement, 'hi')
      expect(subject.solution).to include word(7..8)
    end
  end

  context 'word is not in the puzzle' do
    it '#search_arrangement adds word to solution' do
      arrangement = [line(0..3), line(0..5), line(10..13)]
      subject.search_arrangement(arrangement, 'hi')
      expect(subject.solution).to be_empty
    end
  end
end
