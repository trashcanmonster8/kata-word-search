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
      groups, shifts = @line.size.divmod(@modulus)
      (0..shifts).each do |shift|
        @permutations[shift] = []
        line = @line.clone
        line.shift(shift)
        (1..groups).each do |index|
          @permutations[shift][index - 1] = line.shift(@modulus).join
        end
      end
      @permutations
    end
  end
end
