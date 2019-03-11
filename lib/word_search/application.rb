# frozen_string_literal: true

require 'word_search/common/word'
require 'word_search/solver'
require 'word_search/board'

module WordSearch
  #
  # Entrypoint for running application
  #
  class Application
    def initialize(file)
      @file = file
      @solver = Solver.new
    end

    def load
      data = File.read(@file)
      file_lines = data.split("\n")
      @solver.word_bank = file_lines.shift.split(',')
      @solver.board = WordSearch::Board.new(file_lines.join("\n"))
    end

    def run
      load
      @solver.solve
      print
    end

    def print
      puts(@solver.solution.map(&:inspect).join("\n"))
    end
  end
end
