# frozen_string_literal: true

module WordSearch
  #
  # Finds a word in a line of letters
  #
  class Finder
    attr_reader :word

    def initialize(line, query)
      @line = line
      @query = query
      @word = ''
    end

    def permute(modulus)
      groups = @line.size.div(modulus)
      (0..(modulus - 1)).collect do |shift|
        line = @line.clone
        line.shift(shift)
        (0..groups).collect do
          next if line.size < modulus

          line.shift(modulus)
        end.compact
      end
    end

    def find
      permute(@query.size).find do |set|
        set.find do |letters|
          possible_word = Common::Word.new.join(letters)
          next unless possible_word == @query

          @word = possible_word
          true
        end
      end
      @word
    end
  end
end
