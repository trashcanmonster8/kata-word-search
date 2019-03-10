# frozen_string_literal: true

require 'word_search/common/letter'

module WordSearch
  module Puzzle
    #
    # Word search puzzle
    #
    class Board
      def initialize(string)
        @board = parse(string)
      end

      def parse(string)
        @board = string.split("\n").map.with_index do |line, j|
          line.split(',').map.with_index do |char, i|
            Common::Letter.new(char, i, j)
          end
        end
      end

      def [](index)
        @board[index]
      end

      def rows(direction = :itself)
        @board.collect { |row| row.send(direction) }
      end

      def columns
        @board.transpose
      end
    end
  end
end
