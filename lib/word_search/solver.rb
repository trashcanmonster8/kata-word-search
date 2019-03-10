# frozen_string_literal: true

require 'word_search/puzzle/board'

module WordSearch
  #
  # Implements common and puzzle objects to solve
  # a word search puzzle
  #
  class Solver
    attr_reader :solution
    attr_writer :word_bank

    def initialize
      @solution = []
    end

    def collect_arrangements(board)
      @arrangements = Puzzle::Board::ARRANGEMENTS.collect do |arrangement|
        board.send(arrangement)
      end
      @arrangements << Puzzle::Board::ARRANGEMENTS.collect do |arrangement|
        board.send(arrangement, :reverse)
      end
    end

    alias board= collect_arrangements
  end
end
