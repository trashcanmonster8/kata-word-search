# frozen_string_literal: true

require 'word_search/common/coordinates'

module WordSearch
  module Common
    #
    # Letter in the word search
    #
    class Letter
      attr_reader :char
      attr_accessor :location

      def initialize(char, x_corr = nil, y_corr = nil)
        @char = char.upcase
        @location = Coordinates.new(x_corr, y_corr)
      end

      def found?
        @location.set?
      end

      def ==(other)
        @char == other.char && @location == other.location
      end
    end
  end
end
