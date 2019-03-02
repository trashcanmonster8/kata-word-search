# frozen_string_literal: true

require 'word_search/finder'

RSpec.describe WordSearch::Finder do
  let(:line) { (0..13).collect { |i| WordSearch::Common::Letter.new((i + 97).chr, i, i + 1) } }
  let(:word) { 'hi' }
  subject { WordSearch::Finder.new(line) }

  it '#permute sorts line into different possible permutations' do
    expect(subject.permute(1)[0][10].first).to eq WordSearch::Common::Letter.new('k', 10, 11)
  end

  it '#permute modulo 2' do
    expect(subject.permute(2)[0][2]).to eq [WordSearch::Common::Letter.new('e', 4, 5),
                                            WordSearch::Common::Letter.new('f', 5, 6)]
  end

  it '#permute modulo 3' do
    expect(subject.permute(3)[2][0]).to eq [WordSearch::Common::Letter.new('c', 2, 3),
                                            WordSearch::Common::Letter.new('d', 3, 4),
                                            WordSearch::Common::Letter.new('e', 4, 5)]
  end

  it '#permute module 7' do
    expect(subject.permute(7)[5][0]).to match_array [WordSearch::Common::Letter.new('f', 5, 6),
                                                     WordSearch::Common::Letter.new('g', 6, 7),
                                                     WordSearch::Common::Letter.new('h', 7, 8),
                                                     WordSearch::Common::Letter.new('i', 8, 9),
                                                     WordSearch::Common::Letter.new('j', 9, 10),
                                                     WordSearch::Common::Letter.new('k', 10, 11),
                                                     WordSearch::Common::Letter.new('l', 11, 12)]
  end
end
