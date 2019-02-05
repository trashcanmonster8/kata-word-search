# frozen_string_literal: true

#
# Word class as a collection of Letters
#
class Word
  attr_reader :raw

  def initialize(word)
    @raw = word
  end
end
