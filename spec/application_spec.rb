# frozen_string_literal: true

require 'word_search/application'

RSpec.describe WordSearch::Application do
  subject { WordSearch::Application.new('file_name.txt') }
  let(:solver) { instance_double(WordSearch::Solver) }
  let(:file_data) do
    "test,thing,extra\n" \
    "A,B,C,D,E,F,G\n" \
    "A,B,C,D,E,F,G\n" \
    "A,B,C,D,E,F,G\n" \
    "A,B,C,D,E,F,G\n" \
    'A,B,C,D,E,F,G'
  end
  let(:board_data) do
    "A,B,C,D,E,F,G\n" \
    "A,B,C,D,E,F,G\n" \
    "A,B,C,D,E,F,G\n" \
    "A,B,C,D,E,F,G\n" \
    'A,B,C,D,E,F,G'
  end

  before do
    subject.instance_variable_set(:@solver, solver)
  end

  it '#load imports data to a solver' do
    expect(File).to receive(:read).with('file_name.txt').and_return(file_data)
    expect(solver).to receive(:word_bank=).with(%w[test thing extra])
    expect(solver).to receive(:board=)
      .with(instance_of(WordSearch::Board))
    subject.load
  end

  it '#run loads, solves, and prints solution' do
    expect(subject).to receive(:load)
    expect(solver).to receive(:solve)
    expect(subject).to receive(:print)
    subject.run
  end

  specify '#prints inspects each solution' do
    allow(solver).to receive(:solution).and_return([0, 1, 2, 3, 4])
    expect { subject.print }.to output("0\n1\n2\n3\n4\n").to_stdout
    subject.print
  end
end
