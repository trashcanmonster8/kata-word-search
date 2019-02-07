# frozen_string_literal: true

module WordSearch
  module Common
    #
    # Stores coordinates on the puzzle
    #
    class Coordinate
      attr_reader :x, :y

      def initialize(*coordinates)
        @x = coordinates[0]
        @y = coordinates[1]
      end
    end
  end
end
