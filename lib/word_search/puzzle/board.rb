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

      def columns(direction = :itself)
        @board.transpose.collect { |row| row.send(direction) }
      end

      def forward_diagonal(direction = :itself)
        # Shamelessly stolen the following resource
        # https://stackoverflow.com/questions/2506621/ruby-getting-the-diagonal-elements-in-a-2d-array
        padding = @board.size - 1
        padded_matrix = []

        @board.each do |row|
          inverse_padding = @board.size - padding
          padded_matrix << ([nil] * inverse_padding) + row + ([nil] * padding)
          padding -= 1
        end

        padded_matrix.transpose.map(&:compact).collect do |row|
          row.send(direction)
        end
      end

      def backward_diagonal(direction = :itself)
        # Shamelessly stolen the following resource
        # https://stackoverflow.com/questions/2506621/ruby-getting-the-diagonal-elements-in-a-2d-array
        padding = @board.size - 1
        padded_matrix = []

        @board.reverse_each do |row|
          inverse_padding = @board.size - padding
          padded_matrix << ([nil] * inverse_padding) + row + ([nil] * padding)
          padding -= 1
        end

        padded_matrix.transpose.map(&:compact).collect do |row|
          row.send(direction)
        end
      end
    end
  end
end
