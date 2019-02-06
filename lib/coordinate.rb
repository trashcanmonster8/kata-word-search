# frozen_string_literal: true

class Coordinate
  attr_accessor :x, :y

  def initialize(x_corr = nil, y_corr = nil)
    @x = x_corr
    @y = y_corr
  end
end
