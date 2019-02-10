# frozen_string_literal: true

require 'word_search/permuter'

RSpec.describe WordSearch::Permuter do
  subject { WordSearch::Permuter.new(%w[a s d f], 1) }

  it { is_expected.to have_attributes(permutations: []) }

  it '#permute sorts line into different possible permutations' do
    expect(subject.permute).to eq [%w[a s d f]]
  end

  context 'modulus 2' do
    subject { WordSearch::Permuter.new(%w[a s d f], 2) }

    it '#permute sorts line into different possible permutations' do
      expect(subject.permute).to eq [%w[as df], ['sd']]
    end
  end

  context 'line length of 13' do
    it '#permute modulo 2' do
      permuter = WordSearch::Permuter.new(%w[a b c d e f g h i j k l m], 2)
      expect(permuter.permute).to eq [%w[ab cd ef gh ij kl],
                                      %w[bc de fg hi jk lm]]
    end

    it '#permute modulo 3' do
      permuter = WordSearch::Permuter.new(%w[a b c d e f g h i j k l m], 3)
      expect(permuter.permute).to eq [%w[abc def ghi jkl],
                                      %w[bcd efg hij klm],
                                      %w[cde fgh ijk]]
    end

    it '#permute module 7' do
      permuter = WordSearch::Permuter.new(%w[a b c d e f g h i j k l m], 7)
      expect(permuter.permute).to match_array [%w[abcdefg], %w[bcdefgh], %w[cdefghi],
                                      %w[defghij], %w[efghijk], %w[fghijkl],
                                      %w[ghijklm]]
    end
  end
end
