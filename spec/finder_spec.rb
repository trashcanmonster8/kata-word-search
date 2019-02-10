# frozen_string_literal: true

require 'word_search/finder'

RSpec.describe WordSearch::Finder do
  subject { WordSearch::Finder.new(%w[a s d f], 'a') }

  it { is_expected.to have_attributes(permutations: []) }

  it '#permute sorts line into different possible permutations' do
    expect(subject.permute).to eq [%w[a s d f]]
  end

  context 'modulus 2' do
    subject { WordSearch::Finder.new(%w[a s d f], 'ab') }

    it '#permute sorts line into different possible permutations' do
      expect(subject.permute).to eq [%w[as df], ['sd']]
    end
  end

  context 'line length of 13' do
    it '#permute modulo 2' do
      finder = WordSearch::Finder.new(%w[a b c d e f g h i j k l m], 'ab')
      expect(finder.permute).to eq [%w[ab cd ef gh ij kl],
                                      %w[bc de fg hi jk lm]]
    end

    it '#permute modulo 3' do
      finder = WordSearch::Finder.new(%w[a b c d e f g h i j k l m], 'abc')
      expect(finder.permute).to eq [%w[abc def ghi jkl],
                                      %w[bcd efg hij klm],
                                      %w[cde fgh ijk]]
    end

    it '#permute module 7' do
      finder = WordSearch::Finder.new(%w[a b c d e f g h i j k l m], 'abcdefg')
      expect(finder.permute).to match_array [%w[abcdefg], %w[bcdefgh], %w[cdefghi],
                                      %w[defghij], %w[efghijk], %w[fghijkl],
                                      %w[ghijklm]]
    end
  end
end
