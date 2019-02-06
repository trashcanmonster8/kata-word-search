# frozen_string_literal: true

#
# Letter in the word search
#
class Letter
  attr_reader :char
  attr_writer :x, :y

  def initialize(char, x_corr = nil, y_corr = nil)
    @char = char.upcase
    @x = x_corr
    @y = y_corr
  end

  def found?
    @x && @y
  end
end
