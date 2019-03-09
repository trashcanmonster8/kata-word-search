# frozen_string_literal: true

require 'word_search/common/letter'

module WordSearch
  module Puzzle
    #
    # Word search puzzle
    #
    class Board
      def initialize(string = nil)
        @board = string.is_a?(String) ? parse(string) : nil
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

      def rows(direction = nil)
        @board.collect do |row|
          if direction
            row.send(direction)
          else
            row
          end
        end
      end
    end
  end
end
