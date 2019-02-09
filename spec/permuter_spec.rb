require 'word_search/permuter'

RSpec.describe WordSearch::Permuter do
    subject {WordSearch::Permuter.new('asdf', 1)}

    it { is_expected.to have_attributes(permutations: []) }
end