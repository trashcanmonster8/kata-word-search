# frozen_string_literal: true

require 'word_search/solver'

RSpec.describe WordSearch::Solver do
  subject { WordSearch::Solver.new }

  it {
    is_expected.to have_attributes(board: nil,
                                   word_bank: nil,
                                   solution: [])
  }
end
