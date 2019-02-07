# frozen_string_literal: true

require 'word_search/common/word'

module WordSearch
  module Puzzle
    #
    # Word Bank holds the words for the puzzle
    #
    class WordBank
      def initialize(*args)
        @words = args.collect { |word| Common::Word.new(word) }
      end

      def [](index)
        @words[index]
      end
    end
  end
end
