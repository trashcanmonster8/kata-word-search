# frozen_string_literal: true

module WordSearch
  #
  # Finds a word in a line of letters
  #
  class Finder
    attr_reader :permutations

    def initialize(line)
      @line = line
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

    def find(word)
      permutations = permute(word.size)
      found = nil
      permutations.find do |set|
        found = set.find do |letters|
          possible_word = Common::Word.new
          possible_word.join(letters)
          possible_word == Common::Word.new(word)
        end
      end
      found
    end
  end
end
