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
    let(:arrangement) { [line(0..13), line(0..3), line(10..13)] }
    let(:stub_arrangment) { [arrangement, arrangement, arrangement] }
    let(:query) { 'hi' }

    it '#search_arrangement adds word to solution' do
      subject.search_arrangement(arrangement, query)
      expect(subject.solution).to include word(7..8)
    end

    it '#search_arrangement returns truthy' do
      expect(subject.search_arrangement(arrangement, query)).to be_truthy
    end

    it 'search all arrangements adds first found solution' do
      subject.instance_variable_set(:@arrangements, stub_arrangment)
      is_expected.to receive(:search_arrangement)
        .with(arrangement, query)
        .and_return(nil, 'value')
        .twice
      subject.search(query)
    end

    it '#solve breaks when solved' do
      subject.word_bank = %w[test thing funny extra]
      allow(subject).to receive(:solved?).and_return(false, false, true)
      is_expected.to receive(:search).with('test').once
      is_expected.to receive(:search).with('thing').once
      is_expected.to receive(:search).with('funny').once
      is_expected.to_not receive(:search).with('extra')
      subject.solve
    end

    it '#solve to return truthy' do
      subject.word_bank = %w[test thing funny]
      allow(subject).to receive(:solved?).and_return(true)
      allow(subject).to receive(:search)
      expect(subject.solve).to be_truthy
    end
  end

  context 'word is not in the puzzle' do
    let(:arrangement) { [line(0..3), line(0..5), line(10..13)] }
    let(:stub_arrangment) { [arrangement, arrangement, arrangement] }
    let(:query) { 'nope' }

    it '#search_arrangement does not add word to solution' do
      subject.search_arrangement(arrangement, query)
      expect(subject.solution).to be_empty
    end

    it '#search_arrangement returns falsey' do
      expect(subject.search_arrangement(arrangement, query)).to be_falsey
    end

    it 'search all arrangements searches all arrangments' do
      subject.instance_variable_set(:@arrangements, stub_arrangment)
      is_expected.to receive(:search_arrangement)
        .with(arrangement, query)
        .and_return(nil)
        .exactly(stub_arrangment.size)
        .times
      subject.search(query)
    end

    it '#solve searches all words in :@word_bank' do
      subject.word_bank = %w[test thing funny]
      allow(subject).to receive(:solved?).and_return(false)
      expect(subject).to receive(:search).with('test').once
      expect(subject).to receive(:search).with('thing').once
      expect(subject).to receive(:search).with('funny').once
      subject.solve
    end

    it '#solve to return falsey' do
      subject.word_bank = %w[test thing funny]
      allow(subject).to receive(:solved?).and_return(false)
      allow(subject).to receive(:search)
      expect(subject.solve).to be_falsey
    end
  end
end
