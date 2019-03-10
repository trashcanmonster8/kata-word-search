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
        if other.is_a? Letter
          @char == other.char && @location == other.location
        else
          @char == other.to_s.upcase
        end
      end

      def inspect
        "#{@char}, #{location.inspect}"
      end
    end
  end
end
