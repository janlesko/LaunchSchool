class ValueError < StandardError; end

class Board
  def self.transform(inp)
    raise ValueError if faulty_lines?(inp)
    inp.each_with_index.map do |line, idx1|
      line.chars.each_with_index.map do |char, idx2|
        char == ' ' ? get_num(inp[idx1 - 1], line, inp[idx1 + 1], idx2) : char
      end.join
    end
  end

  def self.get_num(*lines, index)
    mines = 0
    lines.each { |line| mines += line[(index - 1)..(index + 1)].count('*') }
    mines.zero? ? ' ' : mines
  end

  def self.faulty_lines?(inp)
    different_lenght?(inp) || faulty_border?(inp) || invalid_char?(inp)
  end

  def self.different_lenght?(inp)
    inp.map(&:size).uniq.size != 1
  end

  def self.faulty_border?(inp)
    top_and_bottom = inp.first =~ /\+-+\+/ && inp.last =~ /\+-+\+/
    middle = inp[1..-2].all? { |line| line =~ /\A\|[ *]+\|\z/ }
    !(top_and_bottom && middle)
  end

  def self.invalid_char?(inp)
    !(inp.all? { |line| line =~ /[+-|* ]/ })
  end
end