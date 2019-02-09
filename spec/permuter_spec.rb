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
      expect(subject.permute).to eq [%w[as df]]
    end
  end

  context 'line length of 13' do
    subject { WordSearch::Permuter.new(%w[a b c d e f g h i j k l m], 2) }

    it '#permute sorts line into different possible permutations' do
      expect(subject.permute).to eq [%w[ab cd ef gh ij kl], %w[bc de fg hi jk lm]]
    end
  end
end
