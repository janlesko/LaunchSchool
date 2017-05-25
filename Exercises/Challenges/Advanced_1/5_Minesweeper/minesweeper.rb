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
    inp.any? { |line| line.size != inp.first.size }
  end
  
  def self.faulty_border?(inp)
    !(inp.first =~ /\+-+\+/ && inp.last =~ /\+-+\+/)
  end
  
  def self.invalid_char?(inp)
    !(inp.all? { |line| line =~ /[+-|* ]/ })
  end
end

# inp = ['+-----+', '*   * |', '+-- --+']

# p Board.transform(inp)