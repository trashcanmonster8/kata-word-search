# frozen_string_literal: true

require 'word'

#
# Word Bank holds the words for the puzzle
#
class WordBank
  def initialize(*args)
    @words = args.collect { |word| Word.new(word) }
  end

  def [](index)
    @words[index]
  end
end
