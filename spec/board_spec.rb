# frozen_string_literal: true

require 'word_search/common/letter'
require 'word_search/board'

RSpec.describe WordSearch::Board do
  subject { described_class.new("C,B,V\nR,T,M\nW,E,Q") }
  EXPECTED_BOARD = [%w[C B V],
                    %w[R T M],
                    %w[W E Q]].freeze

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

  it '#columns(:reverse)' do
    expect(subject.columns(:reverse)).to eq EXPECTED_BOARD.transpose
                                                          .map(&:reverse)
  end

  it '#forward_diagonal' do
    expect(subject.forward_diagonal).to eq [[],
                                            %w[C],
                                            %w[B R],
                                            %w[V T W],
                                            %w[M E],
                                            %w[Q]]
  end

  it '#forward_diagonal(:reverse)' do
    expect(subject.forward_diagonal(:reverse)).to eq [[],
                                                      %w[C],
                                                      %w[R B],
                                                      %w[W T V],
                                                      %w[E M],
                                                      %w[Q]]
  end

  it '#backward_diagonal' do
    expect(subject.backward_diagonal).to eq [[],
                                             %w[W],
                                             %w[E R],
                                             %w[Q T C],
                                             %w[M B],
                                             %w[V]]
  end

  it '#backward_diagonal(:reverse)' do
    expect(subject.backward_diagonal(:reverse)).to eq [[],
                                                       %w[W],
                                                       %w[R E],
                                                       %w[C T Q],
                                                       %w[B M],
                                                       %w[V]]
  end
end
