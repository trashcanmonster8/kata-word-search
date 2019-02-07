# frozen_string_literal: true

module WordSearch
  module Common
    #
    # Stores coordinates on the puzzle
    #
    class Coordinates
      ORDER = (0..1)

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
        ORDER.all? { |i| self[i] == other[i] }
      end

      def set?
        ORDER.none? { |i| self[i].nil? }
      end
    end
  end
end
