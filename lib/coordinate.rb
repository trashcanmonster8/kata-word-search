# frozen_string_literal: true

class Coordinate
  attr_reader :x, :y

  def initialize(*coordinates)
    @x = coordinates[0]
    @y = coordinates[1]
  end
end
