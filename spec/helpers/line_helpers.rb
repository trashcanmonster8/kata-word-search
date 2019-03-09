# frozen_string_literal: true

module LineHelpers
  def letter(char, x_corr = nil, y_corr = nil)
    WordSearch::Common::Letter.new(char, x_corr, y_corr)
  end

  def line(range)
    range.collect do |i|
      letter((i + 97).chr, i, i + 1)
    end
  end

  def word(range)
    WordSearch::Common::Word.new.join(line(range))
  end
end
