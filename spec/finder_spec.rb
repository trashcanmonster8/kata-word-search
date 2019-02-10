# frozen_string_literal: true

require 'word_search/finder'

RSpec.describe WordSearch::Finder do
  subject { WordSearch::Finder.new(%w[a b c d e f g h i j k l m]) }

  it '#permute sorts line into different possible permutations' do
    expect(subject.permute(1)).to eq [%w[a b c d e f g h i j k l m]]
  end

  it '#permute modulo 2' do
    expect(subject.permute(2)).to eq [%w[ab cd ef gh ij kl],
                                      %w[bc de fg hi jk lm]]
  end

  it '#permute modulo 3' do
    expect(subject.permute(3)).to eq [%w[abc def ghi jkl],
                                      %w[bcd efg hij klm],
                                      %w[cde fgh ijk]]
  end

  it '#permute module 7' do
    expect(subject.permute(7)).to match_array [%w[abcdefg], %w[bcdefgh],
                                               %w[cdefghi], %w[defghij],
                                               %w[efghijk], %w[fghijkl],
                                               %w[ghijklm]]
  end
end
