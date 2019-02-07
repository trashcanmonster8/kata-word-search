# frozen_string_literal: true

require 'word_search/common/coordinates'

module WordSearch
  module Common
    #
    # Letter in the word search
    #
    class Letter
      attr_reader :char
      attr_writer :location

      def initialize(char, x_corr = nil, y_corr = nil)
        @char = char.upcase
        @location = Coordinates.new(x_corr, y_corr)
      end

      def found?
        @location[0] && @location[1]
      end
    end
  end
end
