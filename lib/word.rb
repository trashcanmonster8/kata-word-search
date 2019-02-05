# frozen_string_literal: true

require 'letter'

#
# Word class as a collection of Letters
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
end
