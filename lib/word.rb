# frozen_string_literal: true

require 'letter'

#
# Word class as a collection of Letters
#
class Word
  attr_reader :raw

  def initialize(word)
    @raw = word
  end

  def parse
    @parsed = @raw.split(//).collect do |char|
      Letter.new(char)
    end
    @parsed
  end
end
