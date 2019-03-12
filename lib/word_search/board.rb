# frozen_string_literal: true

require 'word_search/common/letter'

module WordSearch
  #
  # Word search puzzle
  #
  class Board
    ARRANGEMENTS = %i[rows columns forward_diagonal backward_diagonal].freeze

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

    def rows(direction = nil)
      direction(@board, direction)
    end

    def columns(direction = nil)
      direction(@board.transpose, direction)
    end

    def forward_diagonal(direction = nil)
      diagonal(:each, direction)
    end

    def backward_diagonal(direction = nil)
      diagonal(:reverse_each, direction)
    end

    def ==(other)
      @board == other.instance_variable_get(:@board)
    end

    private

    def direction(lines, reverse = nil)
      return lines unless reverse

      lines.collect(&:reverse)
    end

    def diagonal(order, reverse)
      # Shamelessly stolen the following resource
      # https://stackoverflow.com/questions/2506621/ruby-getting-the-diagonal-elements-in-a-2d-array
      padding = @board.size - 1
      padded_matrix = []

      @board.send(order) do |row|
        inverse_padding = @board.size - padding
        padded_matrix << ([nil] * inverse_padding) + row + ([nil] * padding)
        padding -= 1
      end

      direction(padded_matrix.transpose.map(&:compact), reverse)
    end
  end
end
