# frozen_string_literal: true

require 'letter'

#
# Word search puzzle
#
class Puzzle
  def initialize
    @board
  end

  def parse(string)
    @board = string.split("\n").map.with_index do |line, j|
      line.split(',').map.with_index { |char, i| Letter.new(char, i, j) }
    end
  end

  def [](index)
    @board[index]
  end
end
