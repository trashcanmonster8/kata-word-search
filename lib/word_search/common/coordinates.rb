# frozen_string_literal: true

module WordSearch
  module Common
    #
    # Stores coordinates on the puzzle
    #
    class Coordinates
      attr_reader :x, :y

      def initialize(*coordinates)
        @x = coordinates[0]
        @y = coordinates[1]
      end

      def [](index)
        case index
        when 0
          @x
        when 1
          @y
        end
      end

      def ==(other)
        (0..1).all? { |i| self[i] == other[i] }
      end
    end
  end
end
