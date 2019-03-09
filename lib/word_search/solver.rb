# frozen_string_literal: true

module WordSearch
  #
  # Implements common and puzzle objects to solve
  # a word search puzzle
  #
  class Solver
    attr_reader :board, :word_bank, :solution

    def initialize
      @solution = []
    end
  end
end
