# frozen_string_literal: true

require 'word_search/common/letter'

module WordSearch
  module Common
    #
    # Word class as a collection of letters
    #
    class Word
      attr_reader :parse

      def initialize(word = '')
        @raw = word.upcase
        @parse = @raw.split(//).collect do |char|
          Letter.new(char)
        end
      end

      def [](index)
        @parse[index]
      end

      def found?
        @parse.all?(&:found?)
      end

      def ==(other)
        @raw == other.to_s
      end

      def to_s
        @raw
      end

      def size
        @raw.size
      end

      def join(letters)
        @parse = letters
        @raw = letters.map(&:char).join
        self
      end
    end
  end
end
