# frozen_string_literal: true

require 'word_search/permuter'

RSpec.describe WordSearch::Permuter do
  subject { WordSearch::Permuter.new(%w[a s d f], 1) }

  it { is_expected.to have_attributes(permutations: []) }

  it '#permute sorts line into different possible permutations' do
    expect(subject.permute).to eq %w[a s d f]
  end
end
