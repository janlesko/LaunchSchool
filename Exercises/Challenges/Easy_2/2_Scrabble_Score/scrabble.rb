class Scrabble
  def initialize(word)
    return 0 if word == nil
    @result = 0
    @letters = word.chars
  end

  def score
    return 0 if @letters == nil
    @letters.each do |letter|
      @result += case letter.upcase
                 when 'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T' then 1
                 when 'D', 'G'                                         then 2
                 when 'B', 'C', 'M', 'P'                               then 3
                 when 'F', 'H', 'V', 'W', 'Y'                          then 4
                 when 'K'                                              then 5
                 when 'J', 'X'                                         then 8
                 when 'Q', 'Z'                                         then 10
                 else                                                       0
                 end
    end
    @result
  end
  
  def self.score(word)
    new(word).score
  end
end

puts Scrabble.new('cabbage').score