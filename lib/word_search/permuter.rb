# frozen_string_literal: true

module WordSearch
  #
  # Takes an array and creates all permutations
  # of modulus with no remainders
  #
  class Permuter
    attr_reader :permutations

    def initialize(line, modulus)
      @line = line
      @modulus = modulus
      @permutations = []
    end

    def permute
      groups = @line.size.div(@modulus)
      (0..(@modulus - 1)).each do |shift|
        @permutations[shift] = []
        line = @line.clone
        line.shift(shift)
        (0..groups).each do |index|
          next if line.size < @modulus

          @permutations[shift][index] = line.shift(@modulus).join
        end
      end
      @permutations
    end
  end
end
