# frozen_string_literal: true

require 'word_search/common/letter'

module WordSearch
  module Common
    #
    # Word class as a collection of letters
    #
    class Word
      def initialize(word)
        @raw = word
        parse
      end

      def parse
        @parse ||= @raw.split(//).collect do |char|
          Letter.new(char)
        end
      end

      def [](index)
        @parse[index]
      end

      def found?
        @parse.all?(&:found?)
      end
    end
  end
end